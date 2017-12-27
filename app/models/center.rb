class Center < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :confirmable, :recoverable, :rememberable, :trackable, :validatable

  has_many :offers, dependent: :destroy
  has_many :schools

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence:true, length: {maximum: 50}
  validates :last_name, presence:true, length: {maximum: 50}
  validates :phone_number, presence: true, length: {is: 10}, uniqueness: true, numericality: {only_integer: true}
  validates :circonscription, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
