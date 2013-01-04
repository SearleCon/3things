update_Status = (item_id, status, updateUrl) ->
  $.ajax({
  type : 'PUT',
  data: { status: status }
  url : updateUrl,
  dataType: 'json',
  error: (jqXHR, textStatus, errorThrown) ->
    thing = jQuery.parseJSON(jqXHR.responseText)
    element = $('#' + task.id)
    element.detach()
    list = $('#' + task.status)
    list.append(element)
  });



$(document).ready ->
  $('.sortable').sortable({connectWith: '.sortable', helper: 'clone', dropOnEmpty: true})

  $('.sortable').bind 'sortreceive', (event,ui) ->
    update_Status(ui.item.prop('id'), $(this).prop('id'), ui.item.data('moved_path'))

