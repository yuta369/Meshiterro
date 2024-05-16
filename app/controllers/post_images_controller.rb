class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end
  
  # 投稿データの保存
  def create
    # フォームに入力されたデータが、@post_image に格納
    @post_image = PostImage.new(post_image_params)
    # 投稿データに今ログイン中のユーザーの ID を持たせる
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else # 投稿に不備があった場合
      render :new # 投稿ページを再表示
    end
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to "/post_images"
  end
  
  # 投稿データのストロングパラメータ
  private
  # 投稿データとして許可されているパラメータかどうかをチェック
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
