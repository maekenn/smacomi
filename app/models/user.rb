class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_one_attached :image
  enum gender:{ 男性: 0, 女性: 1, 選択しない: 3}

  validates :name, {length: {in: 2..20} }
  validates :name, uniqueness: true
  validates :comment, {length: {maximum: 50}}


end
