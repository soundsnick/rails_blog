class Article < ApplicationRecord
  def self.search(search)
    if search
      where('LOWER(title) LIKE ?', "%#{search.downcase}%")
    else
      all
    end
  end
end
