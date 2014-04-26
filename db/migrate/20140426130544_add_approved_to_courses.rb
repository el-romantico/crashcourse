class AddApprovedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :approved, :boolean, default: false
  end
end
