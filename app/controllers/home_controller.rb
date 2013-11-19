class HomeController < ApplicationController
  def index
    @posts = Post.desc.paginate(:page => params[:page])
    @tags = tags
  end

  def tagged
    @posts = Post.tagged_with(params[:tag]).desc.paginate(:page => params[:page])
    @tags = tags
    render action:'index'
  end

  private

  def tags
    Post.tag_counts_on(:tags)
  end
end
