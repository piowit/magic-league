require "rails_helper"

RSpec.describe "League spec", type: :feature do
  it "lists leagues" do
    league_first = create(:league)
    league_second = create(:league)

    login_as create(:user), scope: :user
    visit root_path

    click_link "Leagues"

    expect(page).to have_content league_first.name
    expect(page).to have_content league_first.start_date
    expect(page).to have_content league_first.end_date
    expect(page).to have_content league_second.name
    expect(page).to have_content league_second.start_date
    expect(page).to have_content league_second.end_date
  end

  it "creates leagues" do
    user = create(:user)

    login_as user, scope: :user
    visit root_path

    click_link "Leagues"
    click_link "New League"

    fill_in "league[name]", with: "New league"
    fill_in "league[description]", with: "Description"
    find("#league_start_date").set(Date.current)
    find("#league_end_date").set(Date.current + 1.month)

    expect do
      click_button "Create League"
    end.to change(League, :count).by(1)

    expect(page).to have_content "New league"
    expect(page).to have_content Date.current
    expect(page).to have_content Date.current + 1.month
    expect(League.find_by(name: "New league").owners).to include(user)
  end

  it "updates league" do
    create(:league, start_date: Date.current + 1.month, end_date: Date.current + 2.months)

    login_as create(:user), scope: :user
    visit root_path
    click_link "Leagues"

    click_link "Edit"
    fill_in "league[name]", with: "edited name"
    fill_in "league[description]", with: "edited description"
    find("#league_start_date").set(Date.current + 1.day)
    find("#league_end_date").set(Date.current + 5.day)
    click_button "Update League"

    click_link "Show"
    expect(page).to have_content "edited name"
    expect(page).to have_content "edited description"
    expect(page).to have_content Date.current + 1.day
    expect(page).to have_content Date.current + 5.day
  end
end
