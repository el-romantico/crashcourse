class AddTagsToRequest < ActiveRecord::Migration
  def change
    create_table :requests_tags, id: false do |t|
      t.belongs_to :request
      t.belongs_to :tag
    end
  end
end
