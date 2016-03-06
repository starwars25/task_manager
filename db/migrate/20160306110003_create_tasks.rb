class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :status
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
