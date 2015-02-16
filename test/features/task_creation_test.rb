require_relative '../test_helper'

class TaskCreationTest < FeatureTest
  def test_user_creates_task
    visit '/'
    click_link_or_button('New Task')
    assert_equal '/tasks/new', current_path
    fill_in 'task[title]', with: 'Eat Ice Cream'
    fill_in 'task[description]', with: 'eat it all'
    # save_and_open_page
    click_link_or_button('Make a task!')
    assert_equal '/tasks', current_path
    within('.task') do
      assert page.has_content?('Eat Ice Cream')
    end
  end

  def test_user_can_edit_a_task
    TaskManager.create({  :title       => "a title",
                          :description => "a description" })
    visit '/tasks/1/edit'
    assert_equal '/tasks/1/edit', current_path
    fill_in 'task[title]', with: 'Eat Ice Cream'
    fill_in 'task[description]', with: 'eat it all'
    click_link_or_button('Make Changes')
    assert_equal '/tasks/1', current_path
    assert page.has_content?("Eat Ice Cream")
  end

  def test_user_can_delete_a_task
    TaskManager.create({  :title       => "a title",
                          :description => "a description" })
    visit '/tasks'
    assert page.has_content?('a title')
    click_link_or_button('Delete')
    assert_equal '/tasks', current_path
    refute page.has_content?('a title')
    assert_equal 0, TaskManager.all.count
  end
end
