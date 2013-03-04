class Vent < ActiveRecord::Base
  belongs_to :user
  has_many :shares
  attr_accessible :public, :text
end
