require "rails_helper"

RSpec.describe "Contest spec", type: :feature do
  it "lists contests" do
    contes_first = create(:contest)
    contest_second = create(:contest)

    login_as create(:user), scope: :user
    visit root_path

    click_link "Contests"

    expect(page).to have_content contes_first.date
    expect(page).to have_content contest_second.date
  end

  it "creates contests" do
    user = create(:user)
    create(:league)

    login_as user, scope: :user
    visit root_path

    click_link "Leagues"
    click_link "Add contest"

    find("#contest_date").set(Date.current + 3.days)

    expect do
      click_button "Create Contest"
    end.to change(Contest, :count).by(1)

    expect(page).to have_content Date.current + 3.days
  end

  it "shows contests" do
    user = create(:user)
    contest = create(:contest)

    login_as user, scope: :user
    visit root_path

    click_link "Contests"
    click_link "Show"

    expect(page).to have_content contest.date
    expect(page).to have_content contest.league.name
  end
end
