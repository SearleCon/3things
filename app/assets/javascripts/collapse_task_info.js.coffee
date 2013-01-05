$(document).ready ->

  $("button .btn .btn-link").click (event) ->
    $(this).find('i').toggleClass 'icon-plus icon-minus'

  $("#Todo").children("#67").effect('highlight');

