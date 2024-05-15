class PostImage < ApplicationRecord
  
  has_one_attached :image

  # アソシエーション ( 1:N の「N」側 )
  belongs_to :user

end
