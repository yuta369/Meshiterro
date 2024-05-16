class PostCommentsController < ApplicationController

  def create
    # パラメータから post_image_id を使って特定の PostImage オブジェクトを探す
    post_image = PostImage.find(params[:post_image_id])
  
    # 現在ログインしているユーザーが新しいコメントを作成する
    comment = current_user.post_comments.new(post_comment_params)
    
    # コメントに関連する投稿画像の ID を設定する
    comment.post_image_id = post_image.id
    
    # コメントをデータベースに保存する
    comment.save
    
    # コメントを追加した後、その投稿画像のページにリダイレクトする
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
