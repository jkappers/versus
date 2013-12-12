class Group < ActiveRecord::Base
  has_many :users
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  def top_users
    User
      .select('email,
        sum(case when users.id = games.winner_id then 1 else 0 end) as win,
        sum(case when users.id = games.loser_id then 1 else 0 end) as loss'
      )
      .joins(:wins)
      .where('group_id = ?', self.id)
      .group('email')
      .order('sum(case when users.id = games.winner_id then 1 else 0 end)')
      .take(10)
  end

end
