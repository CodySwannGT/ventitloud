class Vent < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood
  has_many :shares
  acts_as_commentable
  acts_as_votable
  
  attr_accessible :public, :text, :mood, :mood_id, :user_vote, :user
  attr_accessor :user_vote, :user
  
  validates :mood_id, presence: true
  validates :text, presence: true
  
  before_validation :create_vote
  
  alias_attribute :comments, :comment_threads
  
  default_scope order{ id.desc }
  
  
  def create_vote
    self.vote(voter: user, vote: user_vote)
  end
  
  
  def to_s
    text
  end
end
