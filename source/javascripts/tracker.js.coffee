class Tracker
  submission: (event) ->

  click: (event) ->
    analytics.trackLink event.currentTarget, 'Clicked Link',
      location: $(event.currentTarget).attr('href')

  read: (event) ->
    link = $(event.currentTarget)
    href = link.attr('href')
    element = $(href)

    unless link.hasClass('active')
      analytics.trackLink event.currentTarget, 'Read Artist Bio',
        artist: link.text()

    element.find('.bio').slideToggle 150
    link.toggleClass('active')
    event.preventDefault()


  pageView: (event) ->
    pageName = $('meta[name="page-name"]').attr('content')
    analytics.page pageName

@track = new Tracker()
