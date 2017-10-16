class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities

  validates :first_name, presence:true, length: {maximum: 50}
  validates :last_name, presence:true, length: {maximum: 50}
  validates :phone_number, presence: true, uniqueness: true, on: :update
  validates :soi_number, presence: true, uniqueness: true, on: :update
  validates :circonscription, presence: true, on: :update
  validates :diploma, presence: true, on: :update

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "150x150#" }, default_url: "/assets/placeholder.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
