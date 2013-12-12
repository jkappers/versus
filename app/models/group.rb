class Group < ActiveRecord::Base
  has_many :users
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  def top_users
    User.find_by_sql(
      <<-statement
        select   u.id,
                 u.email,
                 count(*) as total_wins,
                 (select count(*) from games where winner_id = u.id or loser_id = u.id) as total_games
        from     users u
                 join games g on u.id = g.winner_id
        group by u.email
        order by count(*) desc
        limit 10;
      statement
    )
  end

end
