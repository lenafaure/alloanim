class Diploma < ApplicationRecord
  has_and_belongs_to_many :offers, dependent: :destroy
end
