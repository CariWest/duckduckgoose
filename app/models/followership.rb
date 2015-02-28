class Followership < ActiveRecord::Base
  belongs_to :user, {
    :foreign_key => "user_id",
    :class_name => "User"
  }

  belongs_to :follower, {
    :foreign_key => "follower_id",
    :class_name => "User"
  }

  validates_uniqueness_of :user_id, :scope => :follower_id
  validate :user_id_cannot_equal_follower_id

  def user_id_cannot_equal_follower_id
    if self.user_id == self.follower_id
      errors.add(:user_id, "Cannot follow yourself...")
    end
  end
end
