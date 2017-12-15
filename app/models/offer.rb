class Offer < ApplicationRecord
  belongs_to :center
  belongs_to :school
  has_and_belongs_to_many :diplomas
  has_and_belongs_to_many :slots

  validates :date, presence:true
  validates :slots, presence:true
  validates :diplomas, presence:true
  validates :offer_number, presence:true

end
