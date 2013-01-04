$(document).ready ->

 $('.best_in_place').best_in_place();

 $('.highlight_on_success').bind 'ajax:success', () ->
    $(this).closest('li').effect('highlight')

 $('.bounce_on_success').bind 'ajax:success', () ->
    $(this).closest('li').effect('bounce')
