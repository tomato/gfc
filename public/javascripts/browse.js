$(document).ready(function(){
  $(".SelectionImage")
    .hover(
      function(){ $(this).children("img").fadeOut('slow');},
      function(){ $(this).children("img").fadeIn('slow');}
    )
})
