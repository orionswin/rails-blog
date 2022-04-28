
require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { Category.new }

  context 'Validations' do
    it '1. is not valid without title' do
      category.description = 'sample desc'
      category.title = nil

      expect(category).to_not be_valid
      # expect(category.errors).to be_present
      # expect(category.errors.to_h.keys).to include(:title)
    end

    it '2. is not valid without description' do
      category.title = 'sample title'

      expect(category).to_not be_valid
      # expect(category.errors).to be_present
      # expect(category.errors.to_h.keys).to include(:description)
    end
  end
end
