require 'rails_helper'

describe "User updates an exisiting job" do
  scenario "a user can update job" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "QA"
    fill_in "job[description]", with: "testing"
    fill_in "job[level_of_interest]", with: "67"
    fill_in "job[city]", with: "San Diego"

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("QA")
    expect(page).to have_content("testing")
    expect(page).to have_content("67")
  end
end
