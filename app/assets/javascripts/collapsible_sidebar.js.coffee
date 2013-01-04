$(document).ready ->
  $("a.toggles").click ->
    $("a.toggles i").toggleClass "icon-chevron-left icon-chevron-right"
    $("#sidebar").animate
      width: "toggle"
      , 0
    $("#content").toggleClass "span12 span9"
    $("#content").toggleClass "no-sidebar"