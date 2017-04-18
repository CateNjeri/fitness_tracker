require "rails_helper"

RSpec.feature "Create Home Page" do
  scenario do
    visit '/'

    expect(page).to have_link("Home")
    expect(page).to have_link("Olympian Lounge")
    expect(page).to have_content("Olympian Tracker")
    expect(page).to have_content("Keep track of your fitness and update your friends on your active lifestyle!")
  end
end
