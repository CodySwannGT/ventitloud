class VentsController < InheritedResources::Base
  belongs_to :user, optional: true
  belongs_to :mood, optional: true
  load_and_authorize_resource :vent, through: [:user, :mood], shallow: true, except: [:index]
  
  before_filter :authorize_parent
  
  def create
    if params[:vent_id]
      @root_vent = Vent.find(params[:vent_id]).root_vent
      @vent = Vent.new do |vent|
        vent.vent_id = @root_vent.id
        vent.mood = @root_vent.mood
        vent.public = @root_vent.public
        vent.text = @root_vent.text
      end
    else
      @vent = parent? ? parent.vents.build(params[:vent]) : Vent.new(params[:vent])
    end
    
    @vent.user = current_user
    create!{ collection_url }
  end
  
  def update
    @vent = parent? ? parent.vents.find(params[:id]) : Vent.find(params[:id])
    @vent.user = current_user
    update!{ collection_url }
  end
  
  protected
  def collection
    return @vents if @vents
    @vents = end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
  end
  
end
