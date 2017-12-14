require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create contact" do
    
    company = create(:company)

    visit company_path(company)

    fill_in "contact[name]", with: "Katy"
    fill_in "contact[position]", with: "CTO"
    fill_in "contact[email]", with: "me@me.com"

    click_on "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Katy")
    expect(page).to have_content("CTO")
    expect(page).to have_content("me@me.com")
  end
end
