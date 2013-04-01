class VotesController < ApplicationController
  skip_load_and_authorize_resource
  
  def create
    authorize! :create, ActsAsVotable::Vote
    @vent = Vent.find(params[:vent_id])
    @vent.vote voter: current_user, vote: params[:user_vote]
    
    respond_to do |format|
      format.html { redirect_to @vent }
    end
  end
end