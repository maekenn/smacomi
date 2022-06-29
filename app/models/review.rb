class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  enum manufacturer_name: { Apple: 0, Sony: 1, Galaxy: 2, SHARP: 3, Fcnt: 4, その他: 5 }

  def get_image(width,height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
   end
    image.variant(resize_to_fill: [width,height])
  end

  def total
   (holding+battery+camera+response)/4.floor
  end

  validates :smartphone_name, {length: {in: 2..20} }
  validates :kuchikomi, {length: {maximum: 50}}

end
