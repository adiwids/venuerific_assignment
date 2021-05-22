class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :articles

  scope :published, -> { where(published: true) }
end
