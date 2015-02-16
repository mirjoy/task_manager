require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def test_it_creates_a_task
    TaskManager.create({  :title       => "a title",
                          :description => "a description"})
      task = TaskManager.find(1)
      assert_equal "a title", task.title
      assert_equal "a description", task.description
      assert_equal 1, task.id
    end

    def test_it_finds_all_tasks
      TaskManager.create({  :title       => "a title",
                            :description => "a description"})
      TaskManager.create({  :title       => "another title",
                            :description => "another description"})
      total = TaskManager.all
      assert_equal 2, total.count
    end

    def test_it_finds_a_task
      TaskManager.create({  :title       => "a title",
                            :description => "a description"})
      TaskManager.create({  :title       => "another title",
                            :description => "another description"})
      found_task = TaskManager.find(2)
      assert_equal "another title", found_task.title
      assert_equal "another description", found_task.description
    end

    def test_it_deletes_a_task
      TaskManager.create({  :title       => "a title",
                            :description => "a description"})
      TaskManager.create({  :title       => "another title",
                            :description => "another description"})
      total = TaskManager.all
      assert_equal 2, total.count
      TaskManager.delete(1)
      total = TaskManager.all
      assert_equal 1, total.count
      TaskManager.delete(2)
      total = TaskManager.all
      assert_equal 0, total.count
    end

  end
