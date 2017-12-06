class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.string :description
      t.date :due

      t.timestamps
    end
  end
end
