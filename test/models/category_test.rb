
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save Category without title' do
    category = Category.new
    category.description = 'blah blah'

    assert_not category.save, 'Saved Category without a title'
  end
end
