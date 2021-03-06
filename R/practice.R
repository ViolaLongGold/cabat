practice <- function(practice_items) {
  unlist(lapply(
    list(list(id = "training3",
              answer = "1",
              no = 1L),
         list(id = "training4",
              answer = "2",
              no = 2L)
    ),
    function(x) {
      list(
        psychTestR::audio_NAFC_page(
          label = "practice_question",
          prompt = shiny::HTML(psychTestR::i18n("ABAT_0009_I_0001_1",
                                                sub = list(no_example = x$no))),
          url = file.path(practice_items, paste0(x$id, ".mp3")),
          choices = as.character(c(1, 2)),
          labels = lapply(c("ABAT_0010_I_0001_1", "ABAT_0015_I_0001_1"), psychTestR::i18n),
          save_answer = FALSE
        ),
        psychTestR::reactive_page(function(answer, ...) {
          psychTestR::one_button_page(
            if (answer == x$answer)
              psychTestR::i18n("ABAT_0011_I_0001_1") else
                psychTestR::i18n("ABAT_0013_I_0001_1"),
            button_text = psychTestR::i18n("ABAT_0021_I_0001_1")
          )}))}))
}
