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
end
