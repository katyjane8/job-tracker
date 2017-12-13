require 'rails_helper'

describe "User sees contacts" do
  scenario "a user sees contacts on job index page" do
    company = Company.create!(name: "ESPN")
    contact = Contact.create!(name: "Katy", position: "CTO", email: "me@me.com", company: company)

    visit company_jobs_path(company)

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end
end
