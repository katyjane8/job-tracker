require 'rails_helper'

describe "User sees a specific category" do
  scenario "a user sees one category" do
    category = Category.create!(title: "Sportsing")

    visit category_path(category)

    expect(page).to have_content("Sportsing")
  end
end
