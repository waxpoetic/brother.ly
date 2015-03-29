#= require jquery
#= require fake_analytics

jQuery ->
  # Track page views
  analytics.page $('meta[name="page-name"]').attr('content')

  # Track form submissions
  signupForm = document.getElementById('mc-embedded-subscribe-form')
  analytics.trackForm signupForm, 'Signed Up'

  # Track link clicks
  $('.buttons a').each (i, element) ->
    analytics.trackLink element, 'Clicked Link',
      location: $(element).attr('href')

  # Track artist bio reads
  $('.artists li > a').each (i, element) ->
    analytics.trackLink element, 'Read Artist Bio',
      artist: $(element).attr('id')

  # Slide-toggle artist bios
  $('.artists li > a').on 'click', (event) ->
    event.preventDefault()
    $($(this).attr('href')).find('.bio').slideToggle 150
    $(this).toggleClass('active')
    false
