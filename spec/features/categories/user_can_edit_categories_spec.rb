require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    
    category = create(:category)

    visit edit_category_path(category)

    fill_in "category[title]", with: "Silly walking"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Silly walking")
    expect(page).to_not have_content("ESPN")
  end
end
