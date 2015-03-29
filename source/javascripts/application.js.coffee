#= require jquery
#= require ajaxchimp
#= require fake_analytics
#= require tracker

$(document).on 'ready', track.pageView

$('#mc-embedded-subscribe-form').ajaxChimp callback: (response) ->
  form = $('#mc-embedded-subscribe-form')
  analytics.trackForm form[0], 'Signed Up',
    name: $('#mce-NAME').val()
    email: $('#mce-EMAIL').val()

  if response.result == 'success'
    form.hide()
    $('#thank-you-message').slideToggle 150
  else
    alert "Error signing up"

$('nav .buttons a').on 'click', track.click

$('.artists li > a').on 'click', track.read
