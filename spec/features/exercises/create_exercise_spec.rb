require "rails_helper"

RSpec.feature "Create new exercise" do
  before do
    @user = User.create(email: "user@example.com", password: "asdfasdf")
    login_as(@user)
  end
  scenario "User creates exercise correctly" do
    visit "/"
    click_link "My Profile"
    click_link "New Workout"
    expect(page).to have_link("Back")
    fill_in "Duration", with: 37
    fill_in "Workout Details", with: "Pushups"
    fill_in "Activity Date", with: "2016-07-26"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user, exercise))
    expect(exercise.user_id).to eq(@user.id)
  end
end
