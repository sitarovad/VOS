class Director < ApplicationRecord
  has_many :film_directors

  def self.search(search, id)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      default_scoped
    end
  end
end
