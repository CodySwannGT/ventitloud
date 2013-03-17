class Share < ActiveRecord::Base
  belongs_to :vent
  belongs_to :user
  attr_accessible :network, :with
  
  after_create :distribute, if: Proc.new { |share| share.network.present? }
  
  def distribute
    case network.to_s
    when "email"
      ShareMailer.share_email(self).deliver
    end
  end
end
