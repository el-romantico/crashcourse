class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :location
      t.integer :tag_id
      t.integer :requester_id
      t.timestamps
    end
  end
end
