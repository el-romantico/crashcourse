class AddMinParticipantsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :min_participants, :number, :default => 0
  end
end
