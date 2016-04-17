# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'a.edit_link', (e) ->
  e.preventDefault()
  userSeqId = $(this).data('userSequenceId')
  $('.edit_link_' + userSeqId).toggle();
  $('.edit_form_' + userSeqId).toggle();
  $('.user_name_' + userSeqId ).toggle();