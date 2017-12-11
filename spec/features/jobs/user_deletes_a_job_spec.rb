require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "Kingpin")
    category = Category.create!(title: "Sportsing")
    job = Job.create(title: "PA", description: "coffee", level_of_interest: "6",
    city: "Austin", company: company, category: category)

    visit company_job_path(company, job)

    click_on "Delete"

    expect(page).to have_content("PA at Kingpin was successfully deleted!")
  end
end
