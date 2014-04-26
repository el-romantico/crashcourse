class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
