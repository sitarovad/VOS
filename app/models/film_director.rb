class FilmDirector < ApplicationRecord
  belongs_to :director
  belongs_to :film
end
