class Group < ActiveRecord::Base
  has_many :users
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
end
