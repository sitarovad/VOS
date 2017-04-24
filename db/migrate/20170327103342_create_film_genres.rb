class CreateFilmGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :film_genres do |t|

      t.belongs_to :film, foreign_key: true
      t.belongs_to :genre, foreign_key: true
    end
  end
end
