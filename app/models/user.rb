class User < ActiveRecord::Base
  include Tokenable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group

  before_create :add_to_group

  def opponents
    group.users.where.not(id: self.id)
  end

  private

  def add_to_group
    if Group.any?
      self.group = Group.first
    end
  end
end
