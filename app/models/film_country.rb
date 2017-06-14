class FilmCountry < ApplicationRecord
  belongs_to :country
  belongs_to :film
end
