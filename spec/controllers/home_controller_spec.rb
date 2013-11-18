require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should get posts collection" do
      post = FactoryGirl.create(:post)
      get 'index'
      assigns(:posts).should eq([post])
    end
  end
end
