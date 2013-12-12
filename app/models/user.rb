class User < ActiveRecord::Base
  include Tokenable
  include Gravtastic

  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :add_to_group

  belongs_to :group
  has_many :wins,  foreign_key: :winner_id, class_name: 'Game'
  has_many :losses, foreign_key: :loser_id,  class_name: 'Game'

  def opponents
    group.users.where.not(id: self.id)
  end

  def rivals
    User
      .select('email, count(*) as score')
      .joins(:wins)
      .where('group_id = ? and loser_id = ?', self.group_id, self.id)
      .group('email')
  end

  private

  def add_to_group
    if Group.any?
      self.group = Group.first
    end
  end
end
