class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :seen
      t.integer :course_id
      t.integer :lecturer_id
      t.integer :subscriber_id
      t.integer :request_id
      t.timestamps
    end
  end
end
