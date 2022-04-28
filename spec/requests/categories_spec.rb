require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :request do
  describe "GET /categories/new" do
    it "returns the create page" do
      get new_category_path

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    it "creates a new category" do
      post "/categories", params: {category: {id: 1, title: "New Category", description: "fresh na fresh"}}
      
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /categories/1/edit" do
    it "returns the edit page" do
      category = Category.create!(id: 1, title: "New Category", description: "fresh na fresh")
      get "/categories/#{category.id}/edit"
      
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /categories/1" do
    it "returns the category page" do
      category = Category.create!(id: 1, title: "New Category", description: "fresh na fresh")
      get "/categories/#{category.id}"
      
      expect(response).to have_http_status(200)
    end
  end
end
