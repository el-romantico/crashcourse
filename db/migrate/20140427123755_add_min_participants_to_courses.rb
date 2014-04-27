  class AddMinParticipantsToCourses < ActiveRecord::Migration
  def change
    change_column :courses, :min_participants, :number, :default => 0
  end
end
