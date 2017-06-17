class Film < ApplicationRecord
  has_many :user_films
  has_many :film_genres
  has_many :film_actors
  has_many :film_directors
  has_many :film_countries

  def self.search(search, id)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      default_scoped
    end
  end
end
