class Favorite < ApplicationRecord

  # アソシエーション ( 1:N の「N」側 )
  belongs_to :user
  belongs_to :post_image

  # user_idとpost_image_idのペアが一意である（重複しない）状態に制限
  validates :user_id, uniqueness: {scope: :post_image_id}

end
