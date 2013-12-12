class Game < ActiveRecord::Base
  belongs_to :winner, foreign_key: :winner_id, class_name: 'User'
  belongs_to :loser,  foreign_key: :loser_id,  class_name: 'User'
end
