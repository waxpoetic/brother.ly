#= require jquery
#= require fake_analytics
#= require tracker

$(document)
  .on 'ready', track.pageView

$('#mc-embedded-subscribe-form')
  .on 'submit', track.submission

$('nav .buttons a')
  .on 'click', track.click

$('.artists li > a')
  .on 'click', track.read
