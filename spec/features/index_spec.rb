require 'spec_helper'
require 'ostruct'

feature 'index page' do
  let(:data) do
    OpenStruct.new(
      YAML.load_file(File.join(APP_ROOT, 'data', 'site.yml'))
    )
  end

  let(:artists) do
    YAML.load_file(File.join(APP_ROOT, 'data', 'artists.yml'))
  end

  before { visit '/' }

  it 'shows the site title' do
    expect(page).to have_content(data.site)
  end

  it 'links to social networks' do
    expect(page).to have_content('Subscribe')
    expect(page).to have_content('Follow')
    expect(page).to have_content('Like')
  end

  it 'includes the next transmission' do
    expect(page).to have_content('next transmission...')
  end

  it 'renders the form when no live event is scheduled and no ticket link is up' do
    unless data.live_event_url || data.ticket_url
      if data.splash_text
        expect(page).to have_content(data.splash_text)
      else
        expect(page).to have_content('RSVP for our next event')
      end
    end
  end

  it 'renders the ticket link when a url is present' do
    unless data.ticket_url
      expect(page).to have_content('Tickets are on sale now!')
    end
  end


  it 'renders the live event when a url is scheduled' do
    if data.live_event_url
      expect(page).to have_content('Connecting to Live Event...')
    end
  end

  it 'toggles biography visibility for each artist when clicked' do
    if artists
      click_link artists.keys.first.titleize.downcase
      expect(page.find("##{artists.keys.first} .bio")).to be_visible
    end
  end
end
