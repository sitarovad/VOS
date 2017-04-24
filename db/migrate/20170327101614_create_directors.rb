class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|

      t.text :name
      t.date :date_of_birth
      t.text :biography

    end
  end
end
