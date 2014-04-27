class ChangeMinParticipantsTypeInCourses < ActiveRecord::Migration
  def up
    change_column :courses, :min_participants, :integer
  end

  def down
    change_column :courses, :min_participants, :decimal
  end
end
