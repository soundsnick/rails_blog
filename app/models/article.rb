class Article < ApplicationRecord
  def self.search(search)
    if search
      where('LOWER(title) LIKE ? OR LOWER(text) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
    else
      all
    end
  end
end
