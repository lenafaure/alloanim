class School < ActiveRecord::Base

  belongs_to :center

  validates :name, presence:true
  validates :address, presence:true
  validates :circonscription, presence:true
end