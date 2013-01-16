$(document).ready ->

  $(".expand_task").live 'click', (event) ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'


