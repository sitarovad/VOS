class CreateUserFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :user_films do |t|

      t.date :seen_at
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :film, foreign_key: true
    end
  end
end
