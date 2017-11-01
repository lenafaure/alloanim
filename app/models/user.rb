class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities, dependent: :destroy

  validates :first_name, presence:true, length: {maximum: 50}
  validates :last_name, presence:true, length: {maximum: 50}
  validates :phone_number, presence: true, uniqueness: true, on: :update
  validates :soi_number, presence: true, uniqueness: true, on: :update
  validates :circonscription, presence: true, on: :update
  validates :diploma, presence: true, on: :update

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "150x150#" }, default_url: "/assets/placeholder.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # Matching Offers & User
  def self.offer_matches(current_user)
    user_diploma = current_user.try(:diploma)
    user_availabilities = Availability
                              .joins(:user)
                              .select('date', 'time_slot')
                              .where(user_id: current_user.id)
                              .order(:date)
    offers = Offer.all.where('date >= ?', DateTime.now.to_date)
    offers_diploma = Diploma.find_by(name: user_diploma).offers

    matches = []

    user_availabilities.each do |user_availability|
      check_conditions = offers_diploma
                   .where(date: user_availability.date)
                   .where(time_slot: user_availability.time_slot)

      if !check_conditions.empty?
        matches.push(check_conditions)
      end
    end

    return matches
  end

end
