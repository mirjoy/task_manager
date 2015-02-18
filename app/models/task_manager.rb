# require 'sequel'
#
# class TaskManager
#   def self.database
#     if ENV["TASK_MANAGER_ENV"] == 'test'
#       @database ||= Sequel.postgres('task_manager_test')
#     else
#       @database ||= Sequel.postgres('task_manager_dev')
#     end
#   end
#
#   def self.create(task)
#     dataset.insert({:title => task[:title], :description => task[:description] })
#   end
#
#   def self.all
#     dataset
#   end
#
#   def self.find(id)
#     Task.new(dataset[:id => id])
#     # dataset.where(:id => id)
#     # dataset[:task["id"] = id]
#   end
#
#   def self.update(id)
#     dataset.where(:id => id).update(task[:title] = task["title"], task[:description] = task["description"])
#   end
#
#   def self.delete(id)
#     dataset.where(:id => id).delete
#   end
#
#   def self.delete_all
#     dataset.delete
#   end
#
#   private
#
#   def self.dataset
#     database[:task]
#   end
#
# end
