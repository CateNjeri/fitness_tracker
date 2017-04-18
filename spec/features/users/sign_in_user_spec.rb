require "rails_helper"

RSpec.feature "User Sign In" do
  before do
    User.create!(email: "user@example.com", password: "asdfasdf")
  end
  scenario "User Signs in with Correct Credentials" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "asdfasdf"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end
end
