$(document).ready(function(){
  $(".SelectionImage")
    .hover(
      function(){ $(this).children("*").children("img").fadeTo('slow', 0.3);},
      function(){ $(this).children("*").children("img").fadeTo('slow', 1);}
    )
})
