class Post < ApplicationRecord


  has_one_attached :images #para trabajar con active storage
  has_many :comentarios

end
