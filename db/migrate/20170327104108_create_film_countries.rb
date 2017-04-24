class CreateFilmCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :film_countries do |t|

      t.belongs_to :film, foreign_key: true
      t.belongs_to :country, foreign_key: true

    end
  end
end
