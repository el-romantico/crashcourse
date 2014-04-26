class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :course_id
      t.string :address
      t.float :lat
      t.float :lng
    end
    add_index  :locations, :course_id

    add_column :courses, :location_id, :integer
    add_index  :courses, :location_id
  end
end
