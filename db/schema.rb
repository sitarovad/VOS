# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170627105525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.text "name"
    t.date "date_of_birth"
    t.text "biography"
  end

  create_table "countries", force: :cascade do |t|
    t.text "name"
  end

  create_table "directors", force: :cascade do |t|
    t.text "name"
    t.date "date_of_birth"
    t.text "biography"
  end

  create_table "film_actors", force: :cascade do |t|
    t.integer "film_id"
    t.integer "actor_id"
    t.index ["actor_id"], name: "index_film_actors_on_actor_id", using: :btree
    t.index ["film_id"], name: "index_film_actors_on_film_id", using: :btree
  end

  create_table "film_countries", force: :cascade do |t|
    t.integer "film_id"
    t.integer "country_id"
    t.index ["country_id"], name: "index_film_countries_on_country_id", using: :btree
    t.index ["film_id"], name: "index_film_countries_on_film_id", using: :btree
  end

  create_table "film_directors", force: :cascade do |t|
    t.integer "film_id"
    t.integer "director_id"
    t.index ["director_id"], name: "index_film_directors_on_director_id", using: :btree
    t.index ["film_id"], name: "index_film_directors_on_film_id", using: :btree
  end

  create_table "film_genres", force: :cascade do |t|
    t.integer "film_id"
    t.integer "genre_id"
    t.index ["film_id"], name: "index_film_genres_on_film_id", using: :btree
    t.index ["genre_id"], name: "index_film_genres_on_genre_id", using: :btree
  end

  create_table "films", force: :cascade do |t|
    t.text    "name"
    t.text    "content"
    t.date    "created_at"
    t.integer "length"
    t.integer "rating"
  end

  create_table "genres", force: :cascade do |t|
    t.text "label"
  end

  create_table "user_films", force: :cascade do |t|
    t.date    "seen_at"
    t.integer "rating"
    t.integer "user_id"
    t.integer "film_id"
    t.index ["film_id"], name: "index_user_films_on_film_id", using: :btree
    t.index ["user_id"], name: "index_user_films_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "login"
    t.text     "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.index ["login"], name: "index_users_on_login", unique: true, using: :btree
  end

  add_foreign_key "film_actors", "actors"
  add_foreign_key "film_actors", "films"
  add_foreign_key "film_countries", "countries"
  add_foreign_key "film_countries", "films"
  add_foreign_key "film_directors", "directors"
  add_foreign_key "film_directors", "films"
  add_foreign_key "film_genres", "films"
  add_foreign_key "film_genres", "genres"
  add_foreign_key "user_films", "users"
end
