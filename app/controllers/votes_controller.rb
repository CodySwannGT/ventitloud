class VotesController < InheritedResources::Base
  load_resource :vent
  load_and_authorize_resource :vote, through: [:vent], shallow: true, except: [:index]
  
  belongs_to :vent, polymorphic: true, optional: true  
  respond_to :json
  
  def create
    @vent = parent.vents.build
    @vent.vote voter: current_user, vote: params[:user_vote]
    
    respond_to do |format|
      format.html { redirect_to parent }
    end
  end
end