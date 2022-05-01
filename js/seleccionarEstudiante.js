$("select").change(function() {
  if ($(this).val() == "estudiante") {
    $(".estudiantes").attr("disabled", "disabled");
  } else {
    $(".estudiantes").removeAttr("disabled");
  }
}).trigger("change");