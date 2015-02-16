# TASK_MANAGER_ENV is arbitrary name
# ENV tells us which environment we are in, so we can use test data/database

ENV['TASK_MANAGER_ENV'] ||= 'test'

require 'bundler'
Bundler.require

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

require File.expand_path("../../config/environment", __FILE__)

#clears the database after tests

class ModelTest < Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

#Capybara needs to know what the controller file is
Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    TaskManager.delete_all
  end
end
