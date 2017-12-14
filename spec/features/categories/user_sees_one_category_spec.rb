require 'rails_helper'

describe "User sees a specific category" do
  scenario "a user sees one category" do
    category = create(:category)

    visit category_path(category)

    expect(page).to have_content("Silly walking5")
  end
end
