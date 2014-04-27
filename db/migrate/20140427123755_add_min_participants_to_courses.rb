  class AddMinParticipantsToCourses < ActiveRecord::Migration
  def change
    change_column :courses, :min_participants, :integer, :default => 0
  end
end
