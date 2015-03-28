require 'spec_helper'
require 'ostruct'

feature 'index page' do
  let(:data) do
    OpenStruct.new(
      YAML.load_file(File.join(APP_ROOT, 'data', 'site.yml'))
    )
  end

  before { visit '/' }

  it 'shows the title and description' do
    expect(page).to have_content(data.site)
    expect(page).to have_content(data.description)
  end

  it 'links to social networks' do
    expect(page).to have_content('Subscribe')
    expect(page).to have_content('Follow')
    expect(page).to have_content('Like')
  end

  it 'includes the next transmission' do
    expect(page).to have_content('next transmission...')
  end
end
