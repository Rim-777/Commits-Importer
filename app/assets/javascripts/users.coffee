# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'a.edit_link', (e) ->
  e.preventDefault()
  userSeqId = $(this).data('userSequenceId')
  $('.edit_link_' + userSeqId).toggle();
  $('.edit_form_' + userSeqId).toggle();
  $('.user_name_' + userSeqId).toggle();

$(document).on 'click', '.edit_btn', (e) ->
  e.preventDefault()
  userSeqId = $(this).data('userSequenceId')
  $('form.edit_form').bind 'ajax:success', (e, data, status, xhr) ->
    user = $.parseJSON(xhr.responseText)
    userId = user.id
    userName = user.name
    $('.user_name_' + userId).html(userName);
    $('.edit_link_' + userId).show();
    $('.edit_form_' + userId).hide();
    $('.user_name_' + userId).show();
    $('.edit_field_' + userId).val(userName);
  .bind 'ajax:error', (e, xhr, status, error) ->
    errors = $.parseJSON(xhr.responseText)
    message =  errors['errors']['name']
    $('#errors_'+ userSeqId).html(JST["templates/errors"]({message: message}));
  $(this).parent('form').submit()
