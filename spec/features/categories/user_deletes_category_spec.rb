require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = create(:category)

    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Silly walking4 was successfully deleted!")
  end
end
