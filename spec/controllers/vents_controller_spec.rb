require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VentsController do

  # This should return the minimal set of attributes required to create a valid
  # Vent. As you add validations to Vent, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "user" => "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vents as @vents" do
      vent = Vent.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vents).should eq([vent])
    end
  end

  describe "GET show" do
    it "assigns the requested vent as @vent" do
      vent = Vent.create! valid_attributes
      get :show, {:id => vent.to_param}, valid_session
      assigns(:vent).should eq(vent)
    end
  end

  describe "GET new" do
    it "assigns a new vent as @vent" do
      get :new, {}, valid_session
      assigns(:vent).should be_a_new(Vent)
    end
  end

  describe "GET edit" do
    it "assigns the requested vent as @vent" do
      vent = Vent.create! valid_attributes
      get :edit, {:id => vent.to_param}, valid_session
      assigns(:vent).should eq(vent)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vent" do
        expect {
          post :create, {:vent => valid_attributes}, valid_session
        }.to change(Vent, :count).by(1)
      end

      it "assigns a newly created vent as @vent" do
        post :create, {:vent => valid_attributes}, valid_session
        assigns(:vent).should be_a(Vent)
        assigns(:vent).should be_persisted
      end

      it "redirects to the created vent" do
        post :create, {:vent => valid_attributes}, valid_session
        response.should redirect_to(Vent.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vent as @vent" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vent.any_instance.stub(:save).and_return(false)
        post :create, {:vent => { "user" => "invalid value" }}, valid_session
        assigns(:vent).should be_a_new(Vent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vent.any_instance.stub(:save).and_return(false)
        post :create, {:vent => { "user" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vent" do
        vent = Vent.create! valid_attributes
        # Assuming there are no other vents in the database, this
        # specifies that the Vent created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vent.any_instance.should_receive(:update_attributes).with({ "user" => "" })
        put :update, {:id => vent.to_param, :vent => { "user" => "" }}, valid_session
      end

      it "assigns the requested vent as @vent" do
        vent = Vent.create! valid_attributes
        put :update, {:id => vent.to_param, :vent => valid_attributes}, valid_session
        assigns(:vent).should eq(vent)
      end

      it "redirects to the vent" do
        vent = Vent.create! valid_attributes
        put :update, {:id => vent.to_param, :vent => valid_attributes}, valid_session
        response.should redirect_to(vent)
      end
    end

    describe "with invalid params" do
      it "assigns the vent as @vent" do
        vent = Vent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vent.any_instance.stub(:save).and_return(false)
        put :update, {:id => vent.to_param, :vent => { "user" => "invalid value" }}, valid_session
        assigns(:vent).should eq(vent)
      end

      it "re-renders the 'edit' template" do
        vent = Vent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vent.any_instance.stub(:save).and_return(false)
        put :update, {:id => vent.to_param, :vent => { "user" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vent" do
      vent = Vent.create! valid_attributes
      expect {
        delete :destroy, {:id => vent.to_param}, valid_session
      }.to change(Vent, :count).by(-1)
    end

    it "redirects to the vents list" do
      vent = Vent.create! valid_attributes
      delete :destroy, {:id => vent.to_param}, valid_session
      response.should redirect_to(vents_url)
    end
  end

end