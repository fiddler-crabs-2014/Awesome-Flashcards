$(document).ready(function() {
  $("#signup").click(function(){
    $(this).addClass("hidden");
    $("#signup_title").replaceWith("<h3 class='buffer-left-16px'> Sign-up Now! </h3>");
    $("#signup_form").removeClass("hidden");
  });

  // $("#answer_form").submit(function(e){
  //   e.preventDefault();
  //   $.post("/rounds/quiz", $("#answer_form").serialize(), function(response){
  //     alert("hi");
  //     $("#quiz_deck_name")
  //     .replaceWith( "<h2 id='quiz_deck_name'> "+ response.deck_name +"</h2>");

  //     $("#quiz_question")
  //     .replaceWith( "<h1 id='quiz_question'>"+ response.question +"</h1>");

  //     $("#questions_remaining")
  //     .replaceWith( "<p id='questions_remaining'>"+ response.questions_remaining +"</p>");

  //     $("#questions_correct")
  //     .replaceWith( "<p id='questions_correct'>"+ response.correct +"</p>")

  //     $('#answer').val('');
  //     $('#answer').focus()
  //   }, "json");
  // });
});
