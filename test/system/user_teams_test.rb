require "application_system_test_case"

class UserTeamsTest < ApplicationSystemTestCase
  setup do
    @user_team = user_teams(:one)
  end

  test "visiting the index" do
    visit user_teams_url
    assert_selector "h1", text: "User Teams"
  end

  test "creating a User team" do
    visit user_teams_url
    click_on "New User Team"

    fill_in "Team", with: @user_team.team_id
    fill_in "User", with: @user_team.user_id
    click_on "Create User team"

    assert_text "User team was successfully created"
    click_on "Back"
  end

  test "updating a User team" do
    visit user_teams_url
    click_on "Edit", match: :first

    fill_in "Team", with: @user_team.team_id
    fill_in "User", with: @user_team.user_id
    click_on "Update User team"

    assert_text "User team was successfully updated"
    click_on "Back"
  end

  test "destroying a User team" do
    visit user_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User team was successfully destroyed"
  end
end
