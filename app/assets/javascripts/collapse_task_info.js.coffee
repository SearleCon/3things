$(document).ready ->

  $("button").click ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'
