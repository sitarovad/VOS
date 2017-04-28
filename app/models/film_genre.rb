class FilmGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :film
end
