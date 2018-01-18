class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :users
  validates :message, presence: true

  def like(user)
    likes << Like.new(user:user)
  end

  def unlike(user)
    likes.where(user_id:user.id).first.destroy
  end
end
