class CreateFilmDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :film_directors do |t|

      t.belongs_to :film, foreign_key: true
      t.belongs_to :director, foreign_key: true

    end
  end
end
