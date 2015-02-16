require_relative '../test_helper'

class TaskTest < ModelTest
  def test_assigns_attributes_correctly
    task = Task.new({ :title       => "a title",
                      :description => "a description"})
      assert_equal "a title", task.title
      assert_equal "a description", task.description
    end
  end
