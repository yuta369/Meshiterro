class PostImage < ApplicationRecord

  has_one_attached :image

  # アソシエーション ( 1:N の「N」側 )
  belongs_to :user
  # アソシエーション ( 1:N の「1」側 )
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    # 画像が添付されていない場合
    unless image.attached?
      # デフォルト画像のファイルパスを設定
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      # デフォルト画像をimageに添付
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像を返す
    image
  end

  def favorited_by?(user)
    # 引数で渡されたユーザidがFavoritesテーブル内に存在していればtrue、していなければfalseを返す
    favorites.exists?(user_id: user.id)
  end

end
