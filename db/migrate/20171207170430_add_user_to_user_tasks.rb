class AddUserToUserTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_tasks, :user, foreign_key: true
  end
end
