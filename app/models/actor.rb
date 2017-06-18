class Actor < ApplicationRecord
  has_many :film_actors

  def self.search(search, id)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      default_scoped
    end
  end
end
