class AddMinParticipantsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :min_participants, :number
  end
end
