# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  role                   :string           default("regular_user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  ROLES = {
    regular_user: 'regular_user',
    administrator: 'administrator'
  }.freeze

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  enum role: ROLES

  has_many :articles, dependent: :destroy, inverse_of: :author
  has_many :published_articles, -> { published }, class_name: 'Article'

  before_validation :ensure_role, on: :create

  private

  def ensure_role
    self.role = ROLES[:regular_user] unless role
  end
end
