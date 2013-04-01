class CommentsController < InheritedResources::Base
  load_resource :vent
  load_and_authorize_resource :comment, through: [:vent], shallow: true, except: [:index]
  
  belongs_to :vent, polymorphic: true, optional: true  
  respond_to :json
  
  def create
    @comment = parent.comments.build(params[:comment])
    @comment.user = current_user
    
    create!{ params[:return_to].present? ? params[:return_to] : parent_url }
  end
end