class Share < ActiveRecord::Base
  belongs_to :vent
  belongs_to :user
  attr_accessible :network, :with
end
