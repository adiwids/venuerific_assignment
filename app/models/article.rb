# == Schema Information
#
# Table name: articles
#
#  id               :bigint           not null, primary key
#  title            :string
#  slug             :string
#  meta_keywords    :string
#  meta_description :text
#  content          :text
#  published        :boolean
#  author_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Article < ApplicationRecord
  extend FriendlyId

  friendly_id :title

  belongs_to :author, class_name: 'User', inverse_of: :articles

  delegate :email, to: :author, prefix: true

  default_scope { eager_load(:author) }

  scope :published, -> { where(published: true) }

  scope :recent, ->{ order(created_at: :desc) }

  validates :title, presence: true, length: { minimum: 3 }

  validates :content, presence: true, length: { minimum: 100 }

  def self.permitted_attributes
    [
      :title,
      :content,
      :meta_keywords,
      :meta_description,
      :published
    ]
  end
end
