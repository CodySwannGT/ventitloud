class Vent < ActiveRecord::Base
  belongs_to :user
  belongs_to :mood
  has_many :shares
  attr_accessible :public, :text, :mood, :mood_id
  validates :mood_id, presence: true
  
  default_scope order{ id.desc }
end
