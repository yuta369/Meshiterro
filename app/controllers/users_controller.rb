class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 特定のユーザに関連付けられた投稿の1ページ分の決められた数のデータだけを、
    # 新しい順にを取得し@post_imagesに渡す
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
