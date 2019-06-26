standardise_kobo_questions <- function(questions){

questions$name <- tolower(questions$name)
questions$required <- tolower(questions$required)
questions$type <- tolower(questions$type)
questions$calculation <- tolower(questions$calculation)
questions$constraint <- tolower(questions$constraint)
questions$relevant <- tolower(questions$relevant)
questions
}

standardise_kobo_choices <- function(choices){
  choices$list_name <- tolower(choices$list_name)
  choices$name <- tolower(choices$name)
  choices
}