server=function(input, output, session){
  
  shinyjs::onclick("lettres",  updateTabsetPanel(session, inputId="navbar", selected="ABéCéDé"))
  shinyjs::onclick("nombres",  updateTabsetPanel(session, inputId="navbar", selected="123456789"))
  shinyjs::onclick("bebe",     updateTabsetPanel(session, inputId="navbar", selected="AREUH?"))
  shinyjs::onclick("formules", updateTabsetPanel(session, inputId="navbar", selected="ABRACADABRA"))
  
  # -------------------------------------------------------- ABCD
  
  letter = reactiveVal("")
  
  observeEvent(input$abcd_voyelle, {
    letter(  paste0(letter(), sample(voyelles, 1))  )})
  
  observeEvent(input$abcd_espace, {
    letter(  paste0(letter(), espace)  )})
  
  observeEvent(input$abcd_consonne, {
    letter(  paste0(letter(), sample(consonnes, 1))  )})
  
  observeEvent(input$abcd_refaire, {
    letter(  ""  )})
  
  output$abcd_result = renderPrint({cat(switch(1+input$abcd_majuscule, letter(), toupper(letter())))})
  
  
  # -------------------------------------------------------- 1234
  
  text. = reactive({
    n = as.character(input$numbers_n)
    n = paste0(strrep("0", switch(1 + nchar(n)%%3, 0, 2, 1)), n)
    n = str_pad(n, 15, pad = "0")
    
    result = paste(
      ifelse(substr(n, 1, 3)  %in% c("", "000"), "", AddPlural(NameATriplet(substr(n, 1, 3)),   "billion")),
      ifelse(substr(n, 4, 6)  %in% c("", "000"), "", AddPlural(NameATriplet(substr(n, 4, 6)),   "milliard")),
      ifelse(substr(n, 7, 9)  %in% c("", "000"), "", AddPlural(NameATriplet(substr(n, 7, 9)),   "million")),
      ifelse(substr(n, 10, 12)%in% c("", "000"), "", AddPlural(NameATriplet(substr(n, 10, 12)), "mille")),
      ifelse(substr(n, 13, 15)%in% c("", "000"), "",    paste0(NameATriplet(substr(n, 13, 15)), "", collapse="")), collapse=" ")
    # un peu de regex pour enlever les espaces en trop
    result = str_replace(str_replace_all(result, "  *", " "), '^ ', '')
    # si c'est trop long, c'est trop long.
    if (nchar(n)> 15) result = "ce nombre est trop GROOOOOOOOOOS !"
    result})
  
  output$numbers_result <- renderText({ text.() })
  
  observeEvent(input$numbers_refaire, handlerExpr = { updateNumericInput(session, "numbers_n", value=0) })
  
  
  # -------------------------------------------------------- AREUH

  mot = reactiveVal("")
  
  observeEvent(input$bebe_refaire, {
    times = floor(runif(1, min=1, max=6))
    temp <- "A"
    for (times in 0:times){
      temp <- paste0(temp, sample(consBB, 1), sample(voyBB, 1))
    }
    mot(  temp  )
  })
  
  output$bebe_result <- renderPrint({ cat(mot()) })
  
  
  # -------------------------------------------------------- ABRACADABRA
  
  formule. = reactiveVal(" ")
  
  observeEvent(input$formules_refaire, handlerExpr = {
    formule.(  paste(sample(formules, rpois(1, 3), replace = TRUE), collapse="")  )})  
  
  output$formules_result <- renderPrint({  cat(formule.())  })
  

  # FIN
  }