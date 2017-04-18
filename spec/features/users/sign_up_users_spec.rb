require "rails_helper"

RSpec.feature "User Signup" do
  scenario "User Signs Up with Valid Credentials" do
    visit "/"
    click_link "Sign Up!"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "asdfasdf"
    fill_in "Password confirmation", with: "asdfasdf"
    click_button "Sign up"

    expect(page).to have_content("Welcome Olympian! Thanks for signing up!")
  end

  scenario "User Signs Up with Invalid Credentials" do
    visit "/"
    click_link "Sign Up!"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"

    expect(page).to have_content("2 errors prohibited this user from being saved:")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end
