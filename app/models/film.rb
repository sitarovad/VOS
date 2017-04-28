class Film < ApplicationRecord
  has_many :user_films
  has_many :film_genres
end
