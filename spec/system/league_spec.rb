require "rails_helper"

RSpec.describe "League spec", type: :feature do
  it "lists leagues" do
    league_first = create(:league)
    league_second = create(:league)

    login_as create(:user)
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
    league = build(:league)

    login_as create(:user)
    visit root_path

    click_link "Leagues"
    click_link "New League"

    fill_in "league[name]", with: league.name
    fill_in "league[description]", with: league.description
    find("#league_start_date").set((league.start_date))
    find("#league_end_date").set((league.end_date))

    expect do
      click_button "Create League"
    end.to change(League, :count).by(1)

    expect(page).to have_content league.name
    expect(page).to have_content league.start_date
    expect(page).to have_content league.end_date
  end

  it "updates league" do
    create(:league, start_date: Date.current + 1.month, end_date: Date.current + 2.months)

    login_as create(:user)
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