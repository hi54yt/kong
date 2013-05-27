class HomeController < ApplicationController
  def index
    if params[:tag] or params[:category]
      @posts = Post.tagged_with(params[:tag]) unless params[:tag].nil?
      @posts = Category.find_by_name(params[:category]).posts unless params[:category].nil?
    else
      @posts = Post.all
    end
    
    @categories = Category.all
  end

end
