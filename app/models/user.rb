class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :password

  validates :phone_number, presence: true, uniqueness: true,on: :update
  validates :soi_number, presence: true, uniqueness: true, on: :update
  validates :circonscription, presence: true, on: :update
end
