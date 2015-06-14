require 'spec_helper'

RSpec.feature 'signup page' do
  before { visit '/connect' }

  scenario 'shows the signup form' do
    expect(page).to have_content('Tickets for our next event')
  end
end
