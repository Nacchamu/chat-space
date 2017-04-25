class GroupsController < ApplicationController

  before_action :set_groups, only: [:index]
  before_action :find_group, only: [:edit, :update]

  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_comments_path(@group), notice: 'グループが作成されました'
    else
      flash[:alert] = 'グループ名を入力してください'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_comments_path(@group), notice: '編集が完了しました'
    else
      flash[:alert] = 'グループ名を入力してください'
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_groups
    @groups = current_user.groups
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
