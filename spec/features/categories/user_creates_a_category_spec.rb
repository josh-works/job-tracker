require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Web Developer"
    click_on "Create"

    expect(current_path).to eq(categories_path)
    expect(Category.count).to eq(1)
    within("li") do
      expect(page).to have_content("Web Developer")
    end
  end

  scenario "but user cannot create duplicate category" do
    Category.create(title: "Web Developer")
    expect(Category.count).to eq(1)

    visit new_category_path
    fill_in "category[title]", with: "Web Developer"
    click_on "Create"

    expect(Category.count).to eq(1)
  end
end
