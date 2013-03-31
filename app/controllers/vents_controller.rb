class VentsController < InheritedResources::Base
  belongs_to :user, optional: true
  belongs_to :mood, optional: true
  load_and_authorize_resource :vent, through: [:user, :mood], shallow: true, except: [:index]
  
  before_filter :authorize_parent
  
  def create
    create!{ user_vents_url(current_user) }
  end
  
  def update
    update!{ user_vents_url(current_user) }
  end
  
  protected
  def collection
    return @vents if @vents
    @vents = end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
  end
  
end
