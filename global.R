#"APPLICATION"POUR"ENFANTS
#"jouer"avec"les"mots
library(stringr)



# fonctions
NameATriplet = function(ttt){
  if (ttt=="000") return("")
    if (substr(ttt, 1, 1)=="0") {
      return(nombres0a100[as.numeric(substr(ttt, 2, 3))])
    } else if(substr(ttt, 1, 1)=="1") {
      return(paste0(" cent ", nombres0a100[as.numeric(substr(ttt, 2, 3))], collapse=""))
      } else {
      return(paste0(nombres0a100[as.numeric(substr(ttt, 1, 1))], " cent ", nombres0a100[as.numeric(substr(ttt, 2, 3))], collapse=""))
    }
}
AddPlural = function(name, category){
  endstring = ifelse(name=="un" | category =="mille", "", "s")
    return(paste0(name, " ", category, endstring, collapse=""))
}

# stock de mots utiles...
nombres0a100 <- c("un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", 
  "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", 
  "seize", "dix-sept", "dix-huit", "dix-neuf", "vingt", "vingt-et-un", 
  "vingt-deux", "vingt-trois", "vingt-quatre", "vingt-cinq", "vingt-six", 
  "vingt-sept", "vingt-huit", "vingt-neuf", "trente", "trente-et-un", 
  "trente-deux", "trente-trois", "trente-quatre", "trente-cinq", 
  "trente-six", "trente-sept", "trente-huit", "trente-neuf", "quarante", 
  "quarante-et-un", "quarante-deux", "quarante-trois", "quarante-quatre", 
  "quarante-cinq", "quarante-six", "quarante-sept", "quarante-huit", 
  "quarante-neuf", "cinquante", "cinquante-et-un", "cinquante-deux", 
  "cinquante-trois", "cinquante-quatre", "cinquante-cinq", "cinquante-six", 
  "cinquante-sept", "cinquante-huit", "cinquante-neuf", "soixante", 
  "soixante-et-un", "soixante-deux", "soixante-trois", "soixante-quatre", 
  "soixante-cinq", "soixante-six", "soixante-sept", "soixante-huit", 
  "soixante-neuf", "soixante-dix", "soixante-et-onze", "soixante-douze", 
  "soixante-treize", "soixante-quatorze", "soixante-quinze", "soixante-seize", 
  "soixante-dix-sept", "soixante-dix-huit", "soixante-dix-neuf", 
  "quatre-vingts", "quatre-vingt-un", "quatre-vingt-deux", "quatre-vingt-trois", 
  "quatre-vingt-quatre", "quatre-vingt-cinq", "quatre-vingt-six", 
  "quatre-vingt-sept", "quatre-vingt-huit", "quatre-vingt-neuf", 
  "quatre-vingt-dix", "quatre-vingt-onze", "quatre-vingt-douze", 
  "quatre-vingt-treize", "quatre-vingt-quatorze", "quatre-vingt-quinze", 
  "quatre-vingt-seize", "quatre-vingt-dix-sept", "quatre-vingt-dix-huit", 
  "quatre-vingt-dix-neuf")

formules  <- c("abracadabra", "abra", "cadabra", "hokus", "pokus", "raminagrobis", "farfelu", 
              "sakapus", "sapristi", "huluberlu", "charabia", "krak", "octopus", 
              "marabout", "hoc", "bim", "bam", "boum", "zlam", "slam", "zim", 
              "turlututu", "maradjah", "nostradamus", "ratata", "tralala", 
              "rikiki", "pouf", "paf", "crac", "zap", "zinzin", "shazam")

VOYELLES  <- c("A","E","I","O","U") # le Y est classé consonne
CONSONNES <- setdiff(LETTERS, VOYELLES)
voyelles  <- c("a","e","i","o","u")
consonnes <- setdiff(letters, voyelles)
espace    <- "  "

voyBB = c("A", "I", "OU", "OU", "A", "I", "O")
consBB = c("B", "G", "MAM", "B", "G", "D", "D")

