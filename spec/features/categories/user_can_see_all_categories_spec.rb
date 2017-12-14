require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_1, category_2 = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content("Silly walking2")
    expect(page).to have_content("Silly walking3")
    expect(Category.count).to eq(2)
  end
end
