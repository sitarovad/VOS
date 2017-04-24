class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|

      t.text :name
      t.text :content
      t.date :created_at
      t.integer :length
      t.integer :rating

    end
  end
end
