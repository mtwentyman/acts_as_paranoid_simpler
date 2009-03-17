require File.join(File.dirname(__FILE__), 'test_helper')

class Widget < ActiveRecord::Base
  acts_as_paranoid_simple
end

class ParanoidSimplerTest < ActiveSupport::TestCase
  fixtures :widgets
  # Replace this with your real tests.
  def test_should_not_count_deleted_even_if_future_deleted
    assert_equal 1, Widget.count
    assert_equal 1, Widget.count(:all, :conditions => ['title=?', 'widget 1'])
    assert_equal 3, Widget.calculate_with_deleted(:count, :all)
    assert_equal 2, Widget.count_only_deleted
  end
  
end
