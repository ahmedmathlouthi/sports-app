class User < ApplicationRecord
  has_many :follower_connections, class_name: 'Connection', foreign_key: :follower_id, dependent: :nullify
  has_many :followers, through: :follower_connections, class_name: 'User', source: :following
  has_many :following_connections, class_name: 'Connection', foreign_key: :following_id, dependent: :nullify
  has_many :following, through: :following_connections, class_name: 'User', source: :follower

  before_save :set_full_name
  scope :ordered, -> { order(name: :asc) }
  private

  def set_full_name
    self.name = "#{first_name} #{last_name}".titleize
  end
end
