class CommentsController < ApplicationController
  before_action :set_groups, only: [:index, :create]

  def index
  end

  def create
    # binding.pry
    @comment = Comment.new(create_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to group_comments_path(params[:group_id])}
        format.json
      end
    else
      flash[:alert] = '文字を入力してください'
      render :index
    end
  end

  private
  def create_params
    # binding.pry
    params.require(:comment).permit(:comment, :image, :image_cache).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_groups
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @comment = Comment.new
    @users = @group.users
    @comments = @group.comments.includes(:user)
  end
end
