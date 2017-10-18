class School < ActiveRecord::Base
  belongs_to :center
  has_many :offer

  validates :name, presence:true
  validates :address, presence:true
  validates :circonscription, presence:true

end