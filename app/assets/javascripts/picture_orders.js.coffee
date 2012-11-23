# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#multistep functionality find in multistep.js



jQuery ->

  $("#new_picture_order").formToWizard({ submitButton: 'submit' })


  pictures = $('#picture_order_picture_id').html()
  category = $('#photo_pictures :selected').text()
  escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(pictures).filter("optgroup[label='#{escaped_category}']").html()
  $('#picture_order_picture_id').html(options)

  $('#photo_pictures').change ->
    category = $('#photo_pictures :selected').text()
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(pictures).filter("optgroup[label='#{escaped_category}']").html()
    $('#picture_order_picture_id').html(options)


  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset#photos').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
