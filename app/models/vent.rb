class Vent < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood
  belongs_to :vent
  has_many :vents
  has_many :shares
  
  acts_as_commentable
  acts_as_votable
  
  attr_accessible :public, :text, :mood, :mood_id, :user_vote, :user
  attr_accessor :user_vote, :user
  
  validates :mood_id, presence: true
  validates :text, presence: true
  
  before_validation :create_vote, if: Proc.new { |vent| vent.user_vote && vent.user }
  after_create :create_share, unless: Proc.new { |vent| vent.vent_id.nil? }
  
  alias_attribute :comments, :comment_threads
  
  default_scope order{ id.desc }
  
  
  def create_vote
    self.vote(voter: user, vote: user_vote)
  end
  
  def root_vent(parent=nil)
    parent ||= self
    return parent if parent.vent.nil?
    root_vent(parent.vent)
  end
  
  
  def to_s
    text
  end
  
  def create_share
    root_vent.shares.create(network: 'Vent It Loud')
  end
end
