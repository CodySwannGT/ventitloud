class Mood < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :vents
  
  validates :name, presence: true, uniqueness: true
  
  default_scope order{ name.asc }
  
  def to_s
    name
  end
end
