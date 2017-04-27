class DeleteDateAndAddTimestamps < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :signed_in_at, :created_at
    change_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
  end
end
