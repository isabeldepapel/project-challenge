require "rails_helper"

RSpec.feature "Home page", :type => :feature do
  scenario "New user lands on site" do
    2.times { create(:dog) }

    visit "/"

    expect(page).to have_selector('.dog-photo', count: 2)
    expect(page).to have_selector('.dog-name', count: 2)

    expect(page).to have_text("Sign in")
    expect(page).to have_text("Sign up")
  end

  scenario "Pagination, 5 dogs per page" do
    6.times { create(:dog) }

    visit "/"
    expect(page).to have_css('div.pagination')
    expect(page).to have_css('.previous_page.disabled')
    expect(page).to have_css('a.next_page')
    expect(page).to have_selector('.dog-photo', count: 5)

    visit "/dogs?page=2"
    expect(page).to have_selector('.dog-photo', count: 1)
  end
end
