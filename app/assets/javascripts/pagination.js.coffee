$ ->
  $.setAjaxPagination = ->
    $('.pagination a').click (event) ->
      event.preventDefault()
      holdingDiv = $(this).parent().parent()
      holdingDiv.spin()
      $.ajax type: 'GET', url: $(@).attr('href'), dataType: 'script',  success: (->  holdingDiv.spin(false))
      false

  $.setAjaxPagination()