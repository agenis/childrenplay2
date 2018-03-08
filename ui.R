library(shiny)
library(stringr)
library(shinythemes)
library(shinyjs)
library(colourpicker)

widget_style  <- "display: inline-block; vertical-align: text-top; padding: 8px; # border: solid; border-width: 1px; border-radius: 4px; border-color: #CCC;"
widget_style2 <- "display: inline-block; vertical-align: text-top; padding: 8px; # border: solid; border-width: 1px; border-radius: 4px; background-color: #f4dc42;"


ui <- fluidPage(theme = shinytheme("cerulean"), useShinyjs(), 
                tags$head(tags$style("#abcd_result{color: red; font-size: 72px; font-style: bold; }"),
                          tags$style("#formules_result{color: red; font-size: 72px; font-style: bold; }"),
                          tags$style("#bebe_result{color: red; font-size: 72px; font-style: bold; }"),
                          tags$style("#numbers_result{color: red; font-size: 72px; font-style: bold; }")),
                navbarPage(id="navbar", title="", 
                           
                            
                           # -------------------------------------------------------- PAGE D'ACCUEIL
                           tabPanel(title="Accueil",
                                    titlePanel("Bienvenue sur cet appli pour enfants de 3 à 7 ans!"),
                                    h4("Les enfants adorent dire n'importe quoi et inventer des mots. Profitons-en pour leur apprendre à lire! Quatre activités sont proposées:"),
                                    
                                    wellPanel(
                                      div(style=widget_style, h4("CREER UN MOT"), h5("En choisissant des consonnes et voyelles aléatoires,"), h5("l'enfant peut créer un mot et essayer de le prononcer")),
                                      div(style=widget_style, img(id="lettres", src="lettres.jpg", style="cursor:pointer;", width=100))
                                    ),
                                    
                                    wellPanel(
                                      div(style=widget_style, h4("LES NOMBRES"), h5("En tapant des chiffres les uns à la suite des autres, "), h5("l'enfant essayera de prononcer le gigantesque nombre qu'il a créé")),
                                      div(style=widget_style, img(id="nombres", src="nombres.gif", style="cursor:pointer;", width=150))
                                    ),
                                    
                                    wellPanel(
                                      div(style=widget_style, h4("QUE DIT BEBE?"), h5("Quoi de plus drole que d'essayer d'imiter les premiers babillements de petit frère ou soeur!"), h5("Voici générateur de mots de bébé aléatoires à prononcer,"), h5("pour le plus grand amusement des enfants.")),
                                      div(style=widget_style, img(id="bebe", src="bebe.png", style="cursor:pointer;", width=150))
                                    ),
                                    
                                    wellPanel(
                                      div(style=widget_style, h4("FORMULES MAGIQUES [♣ bêta]"), h5("Un générateur de formules magiques,"), h5("à partir d'une liste de mots les plus employés par les sorcières.")),
                                      div(style=widget_style, img(id="formules", src="formules.gif", style="cursor:pointer;", width=120))
                                    ),
                                    hr(),
                                    h5(em("Réalisation: marc.agenis@gmail.com, 2018"))
                                    
                           ),
                           
                           
                           # -------------------------------------------------------- ABCD
                           tabPanel(title="ABéCéDé",
                                    fluidRow(
                                      actionButton("abcd_voyelle", "VOYELLE"),
                                      actionButton("abcd_consonne", "CONSONNE"),
                                      actionButton("abcd_espace", "ESPACE"),
                                      actionButton("abcd_refaire", "REFAIRE"),
                                      checkboxInput("abcd_majuscule", "maj?")
                                    ),
                                    br(),
                                    br(),
                                    textOutput("abcd_result")
                           ),
                           
                           
                           # -------------------------------------------------------- 123456
                           tabPanel(title="123456789",
                                    fluidRow(column(5, numericInput("numbers_n", "Tape un nombre ici:", 0, min=0)), column(2, style = "margin-top: 25px;", actionButton("numbers_refaire", "REFAIRE"))),
                                    br(),
                                    br(),
                                    textOutput("numbers_result")
                           ),
                           
                           
                           # -------------------------------------------------------- AREUH
                           tabPanel(title="AREUH?",
                                    actionButton("bebe_refaire", "Inventer un mot"),
                                    br(),
                                    br(),
                                    textOutput('bebe_result')
                           ),
                           
                           
                           # -------------------------------------------------------- ABRACADABRA
                           tabPanel(title="ABRACADABRA",
                                    actionButton("formules_refaire", "NOUVELLE FORMULE!"),
                                    br(),
                                    br(),
                                    div(style=widget_style2, textOutput('formules_result'))
                           )
                ))