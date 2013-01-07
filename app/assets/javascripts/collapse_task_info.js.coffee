$(document).ready ->

  $(".expand_task").click (event) ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'


