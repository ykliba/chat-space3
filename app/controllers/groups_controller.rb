class GroupsController < ApplicationController
  before_action :set_group,only: [:edit, :update]
  def index
  end
  
  def new
    @group = Group.new
    # newアクションの中で、@groupに空のインスタンスを代入しています。これは、form_forで使用するための変数
    @group.users << current_user
    # 「<<」という記号が使われていますが、これは配列に要素を追加するためのもの
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
  # 配列に対して保存を許可したい場合は、キーの名称と関連づけてバリューに「[]」と記述します。

  def set_group
    @group = Group.find(params[:id])
  end
end
