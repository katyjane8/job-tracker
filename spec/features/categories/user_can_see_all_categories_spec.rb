require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    Category.create!(title: "Sportsing")
    Category.create!(title: "Tennis")

    visit categories_path

    expect(page).to have_content("Sportsing")
    expect(page).to have_content("Tennis")
    expect(Category.count).to eq(2)
  end
end
