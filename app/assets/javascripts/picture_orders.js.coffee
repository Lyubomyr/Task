# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  pictures = $('#picture_order_picture_id').html()

  category = $('#picture_order_picture_photo_picture_id :selected').text()
  escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(pictures).filter("optgroup[label='#{escaped_category}']").html()
  $('#picture_order_picture_id').html(options)

  $('#picture_order_picture_photo_picture_id').change ->
    category = $('#picture_order_picture_photo_picture_id :selected').text()
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(pictures).filter("optgroup[label='#{escaped_category}']").html()
    $('#picture_order_picture_id').html(options)
