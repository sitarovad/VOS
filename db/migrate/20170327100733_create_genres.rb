class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|

      t.text :label
    end
  end
end
