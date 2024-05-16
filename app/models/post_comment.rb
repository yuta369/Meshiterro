class PostComment < ApplicationRecord
  
  # アソシエーション ( 1:N の「N」側 )
  belongs_to :user
  belongs_to :post_image
  
end
