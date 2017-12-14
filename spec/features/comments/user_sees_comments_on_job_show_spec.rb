require 'rails_helper'

describe "User sees comments" do
  scenario "a user sees comments on job detail page" do
    category = create(:category)
    company = create(:company)
    job = company.jobs.create!(title: "Shouting", level_of_interest: 70,
    city: "Denver", category: category)
    job.comments.create!(content: "called Larry")

    visit company_job_path(company, job)

    expect(page).to have_content("called Larry")
  end
end
