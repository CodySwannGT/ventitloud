class VentsController < InheritedResources::Base
  belongs_to :user, optional: true
  belongs_to :mood, optional: true
  load_and_authorize_resource :vent, through: [:user, :mood], shallow: true, except: [:index]
  
  before_filter :authorize_parent
  
  def create
    @vent = parent? ? parent.vents.build(params[:vent]) : Vent.new(params[:vent])
    @vent.user = current_user
    create!{ collection_url }
  end
  
  def update
    update!{ collection_url }
  end
  
  protected
  def collection
    return @vents if @vents
    @vents = end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
  end
  
end
