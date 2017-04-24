class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.text :name
      t.text :login
      t.index :login, unique: true
      t.text :password
      t.date :signed_in_at

    end
  end
end
