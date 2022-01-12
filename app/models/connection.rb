class Connection < ApplicationRecord
  belongs_to :follower, class_name: 'User', inverse_of: :follower_connections
  belongs_to :following, class_name: 'User', inverse_of: :following_connections
end
