class RemoveLongDescriptionFromDesks < ActiveRecord::Migration[6.0]
  def change
    remove_column :desks, :long_description, :text
  end
end
