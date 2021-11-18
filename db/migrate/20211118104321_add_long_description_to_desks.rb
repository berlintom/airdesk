class AddLongDescriptionToDesks < ActiveRecord::Migration[6.0]
  def change
    add_column :desks, :long_description, :text
  end
end
