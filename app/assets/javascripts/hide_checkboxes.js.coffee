$(document).ready ->

  $('.task_list [type="submit"]').click ->
    if !$(this).data('updatelist')
      $(this).data('updatelist', true)
      taskList = $(this).parent().prop('id').replace('_list_form', '')
      $("##{taskList}").children('li').children('[type="checkbox"]').css("visibility", "visible")
      $(this).val('Remove')
      return false


  $('form .task_list').submit ->
    $fields = $(this).find('input[type="checkbox"]:checked');
    if (!$fields.length)
     $(this).find('input[type="submit"]').val('Edit list')
     $(this).find('input[type="submit"]').data('updatelist', false)
     $('[type="checkbox"]').css("visibility", "hidden")
     return false
