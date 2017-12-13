require 'rails_helper'

describe "When a user visit '/dashboard'" do
  before(:each) do
    company_1 = create(:company)
    company_2 = Company.create!(name: "Turing")
    company_3 = Company.create!(name: "Ibotta")
    company_4 = Company.create!(name: "SpotX")
    category = create(:category)
    company_1.jobs.create!(title: "Developer", level_of_interest: 70, city: "San Francisco", category: category)
    company_2.jobs.create!(title: "QA Analyst", level_of_interest: 75, city: "New York City", category: category)
    company_2.jobs.create!(title: "Ruler of the world", level_of_interest: 85, city: "Remote", category: category)
    company_3.jobs.create!(title: "Manger of People", level_of_interest: 75, city: "Remote", category: category)

    visit '/'
  end

  it "the user sees a count of jobs by level of interest" do
    expect(page).to have_content("Level of Interest: 70 (1 job/s)")

  end

  it "the user sees the top 3 companies ranked by avg level of interest" do
    expect(page).to have_content("Top Three Companies Ranked by Average Level of Interest")
    expect(page).to have_content("Level of Interest: 85")

  end

  it "the user sees a list of location links and job counts" do
    expect(page).to have_content("San Francisco (1 job/s)")
  end
end
