class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :tag_list, :category_id)
    end
end
