$(document).ready ->

  $("button .btn .btn-link").click (event) ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'


