class User < ApplicationRecord
  include Clearance::User
  has_many :shouts , dependent: :destroy
  validates :username, presence: true, uniqueness: true
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  def like(shout)
   liked_shouts << shout
  end

  def has_liked?(shout)
     liked_shout_ids.include?(shout.id)
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

 
 def to_param
  username
 end
end
