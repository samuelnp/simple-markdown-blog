class HomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page]).order('id DESC')
  end
end
