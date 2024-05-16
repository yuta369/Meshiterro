class FavoritesController < ApplicationController

  def create
    # パラメータから post_image_id を使って特定の PostImage オブジェクトを探す
    post_image = PostImage.find(params[:post_image_id])
    
    # 現在ログインしているユーザーが新しく「いいね」を押す
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    
    # 「いいね」をデータベースに保存する
    favorite.save
    
    # 「いいね」を追加した後、その投稿画像のページにリダイレクトする
    redirect_to post_image_path(post_image)
  end

  def destroy
    # パラメータから post_image_id を使って特定の PostImage オブジェクトを探す
    post_image = PostImage.find(params[:post_image_id])
    
    # 現在ログインしているユーザーの「いいね」から、特定の投稿画像の「いいね」を探す
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    
    # 「いいね」をデータベースから削除する
    favorite.destroy
    
    # 「いいね」を削除した後、その投稿画像のページにリダイレクトする
    redirect_to post_image_path(post_image)
  end

end
