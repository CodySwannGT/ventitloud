class SharesController < InheritedResources::Base
  belongs_to :vent
  load_and_authorize_resource :share, through: :vent, except: [:index]
  
  before_filter :authorize_parent
  
  def create
    @share = parent.shares.build(params[:share])
    @share.network = 'email'
    @share.user = current_user
    create!{ parent }
  end
  
  def update
    update!{ parent }
  end
  
  protected
  def collection
    return @shares if @shares
    @shares = end_of_association_chain.accessible_by(current_ability).paginate(:page => params[:page])
  end
  
  
end
