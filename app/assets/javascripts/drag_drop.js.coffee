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
  $('.draggable').draggable
    cursor: "crosshair"
    opacity: 0.35
    appendTo: "body"
    snap:true
    drag: ->
      $(this).addClass "active"
      $(this).closest("li").addClass "active"
    stop: ->
      $(this).removeClass("active").closest("li").removeClass "active"

  $('#todo li .droppable').droppable
    activeClass: "active"
    hoverClass: "hover"
    tolerance: "touch"
    accept: "doing"

    drop: (event,ui) ->
      tabItem = $(this)
      move = ui.draggable
      update_Status(move, tabItem.data('status'), move.data('moved_path'))


  $('#doing li .droppable').droppable
    activeClass: "active"
    hoverClass: "hover"
    tolerance: "touch"
    accept: "todo"

    drop: (event,ui) ->
      tabItem = $(this)
      move = ui.draggable
      update_Status(move, tabItem.data('status'), move.data('moved_path'))