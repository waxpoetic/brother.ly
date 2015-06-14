require 'spec_helper'

RSpec.feature 'signup page' do
  before { visit '/connect' }

  scenario 'shows a message' do
    expect(page).to have_content('Sign up for our next event')
  end

  scenario 'shows the signup form' do
    expect(page).to have_content('RSVP for our next event')
  end
end
