
require 'rails_helper'

RSpec.describe "Categories", type: :feature do
  describe "View new category page" do
    before { visit new_category_path }

    it 'Show a new page' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Description'
      expect(page).to have_selector(:link_or_button, 'Save')
    end
  end

  describe 'Fillup form and submit' do
    before { visit new_category_path }

    it 'submits the form' do
      within 'form' do
        fill_in 'category_title', with: 'Example Title'
        fill_in 'category_description', with: 'Example text'
        click_on 'Save'
      end

      expect(page).to have_current_path '/categories'
    end
  end

  describe "Edit a Category" do
    before { visit new_category_path }

    it 'creates then edits a category' do
      within 'form' do
        fill_in 'category_title', with: 'Example Title'
        fill_in 'category_description', with: 'Example text'
        click_on 'Save'
      end

      expect(page).to have_current_path '/categories'
      click_on "Example Title"

      click_on "Edit category"
        within 'form' do
          fill_in 'category_title', with: 'Edited Title'
          fill_in 'category_description', with: 'Edited text'
          click_on 'Update Category'
        end

      expect(page).to have_content 'Edited Title'
    end

    # it 'Opens the Category' do
    #   debugger
    #   expect(page).to have_selector(:link_or_button, "Example Title")
    #   click_on "Example Title"

    #   expect(page).to have_current_path edit_category_path
    #     within 'form' do
    #       fill_in 'category_title', with: 'Edited Title'
    #       fill_in 'category_description', with: 'Edited text'
    #       click_on 'Update Category'
    #     end
    #   expect(page).to have_current_path category_path
    # end
  end
end
