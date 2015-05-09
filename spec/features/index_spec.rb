require 'spec_helper'
require 'ostruct'

feature 'index page' do
  let(:data) do
    OpenStruct.new(
      YAML.load_file(File.join(APP_ROOT, 'data', 'site.yml'))
    )
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

  it 'renders the form when no live event is scheduled' do
    unless data.live_event_url.present?
      expect(page).to have_content('RSVP for our next event')
    end
  end

  it 'renders the live event when a url is scheduled' do
    if data.live_event_url.present?
      expect(page).to have_content('Connecting to Live Event...')
    end
  end

  xit 'toggles biography visibility for each artist when clicked' do
    click_link 'the wonder bars'
    expect(page.find('#the_wonder_bars .bio')).to be_visible
  end
end
