$(document).ready ->

  $(document).delegate '.expand_task','click', ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'


