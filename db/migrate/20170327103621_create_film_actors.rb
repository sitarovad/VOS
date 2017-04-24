class CreateFilmActors < ActiveRecord::Migration[5.0]
  def change
    create_table :film_actors do |t|

      t.belongs_to :film, foreign_key: true
      t.belongs_to :actor, foreign_key:true

    end
  end
end
