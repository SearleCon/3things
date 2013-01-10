update_Status = (item_id, status, updateUrl) ->
  $.ajax({
  type : 'PUT'
  data: { status: status }
  url : updateUrl
  dataType: 'script'
  });




$(document).ready ->
  $('.draggable').draggable
    cursor: "crosshair"
    opacity: 0.35
    appendTo: "body"
    revert: "invalid"
    drag: ->
      $(this).addClass "active"
      $(this).closest("li").addClass "active"
    start: ->
        element = $(this)
        tabItem = $("#" + element.data('status').toLowerCase() + "_tab")
        tabItem.droppable("option", "disabled", true)
        tabItem.hide()

    stop: ->
      element = $(this)
      element.removeClass("active").closest("li").removeClass "active"
      tabItem = $("#" + element.data('status').toLowerCase() + "_tab")
      tabItem.droppable("option", "disabled", false)
      tabItem.show()


  $('.droppable').droppable
    activeClass: "active"
    tolerance: "touch"
    hoverClass: 'hover'
    greedy: true
    accept: (ui) ->
      tabItem = $(this)
      if tabItem.data('status') == ui.data('status')
       return false
      return true


    drop: (event,ui) ->
      tabItem = $(this)
      move = ui.draggable
      update_Status(move, tabItem.data('status'), move.data('moved_path'))