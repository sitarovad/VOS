class RemoveForeignKeyFromUserFilms < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :user_films, column: :film_id
  end
end
