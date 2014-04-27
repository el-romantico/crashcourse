class ChangeRequestLocationToObject < ActiveRecord::Migration
  def change
    remove_column :locations, :course_id

    add_column :requests, :location_id, :integer
    add_index  :requests, :location_id
  end
end
