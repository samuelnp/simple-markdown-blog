require 'spec_helper'

describe PostsController do

  # Mock Ability object and stub method for correct validation in controllers
  before(:each) do
    ability = double(:ability).as_null_object
    controller.stub(:current_ability).and_return(ability)
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => FactoryGirl.attributes_for(:post)}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = FactoryGirl.create(:post)
        Post.any_instance.should_receive(:update).with({ "title" => "title example", "body" => "Body example"})
        put :update, {:id => post.to_param, :post => {"title" => "title example", "body" => "Body example"}}
      end

      it "assigns the requested post as @post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        response.should redirect_to(post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = FactoryGirl.create(:post)
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {"title" => "", "body" => ""}}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = FactoryGirl.create(:post)
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.to_param, :post => {"title" => "", "body" => ""}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = FactoryGirl.create(:post)
      delete :destroy, {:id => post.to_param}
      response.should redirect_to(posts_url)
    end
  end
end