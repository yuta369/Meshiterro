class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # パスワードの正確性を検証
         :registerable,             # ユーザ登録や編集、削除
         :recoverable,              # パスワードをリセット
         :rememberable,             # ログイン情報を保存
         :validatable               # email のフォーマットなどのバリデーション

  # アソシエーション ( 1:N の「1」側 )
  has_many :post_images, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, height)
    # プロフィール画像が添付されていない場合
    unless profile_image.attached?
      # デフォルトプロフィール画像のファイルパスを設定
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      # デフォルトプロフィール画像をprofile_imageに添付
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像サイズの変更
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
