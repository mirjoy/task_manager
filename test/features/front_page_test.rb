require_relative '../test_helper'

class FrontPageTest < FeatureTest
  def test_the_front_page_welcomes_user
    visit '/'
    assert page.has_content?("Welcome to the Task Manager")
    within('#head') do
      assert page.has_content?('Welcome')
    end
  end

  def test_user_sees_index_and_new_links
    visit '/'
    within('.frontpage') do
      assert page.has_link?("Task Index")
      assert page.has_link?("New Task")
    end
    page.find_link("Task Index").visible?
  end
end

#click_link_or_button(identifier)
#assert_equal '/', current_path
#save_and_open_page will open a browser and show
#you what capybara is looking at (via launchy gem)
