class Film < ApplicationRecord
  has_many :user_films
  has_many :film_genres
  has_many :film_actors
  has_many :film_directors
  has_many :film_countries
end
