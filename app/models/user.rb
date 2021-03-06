class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :confirmable, :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities, dependent: :destroy

  validates :first_name, presence:true, length: {maximum: 50}
  validates :last_name, presence:true, length: {maximum: 50}
  validates :phone_number, presence: true, length: {is: 10}, uniqueness: true, numericality: {only_integer: true}
  validates :birthday, presence: true, on: :update
  validates :soi_number, presence: true, on: :create, uniqueness: true, length: {is: 7}, numericality: { only_integer: true }
  validates :circonscription, presence: true
  validates :diploma, presence: true, on: :update

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "150x150#" }, default_url: "/assets/profile_default.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      :signed_up_but_unconfirmed
    end
  end

  # Calculate user's age
  def self.age(current_user)
    user_birthdate = current_user.birthday
    user_age = Time.current.year - user_birthdate.year
    return user_age
  end

  # Matching Offers & User availabilities
  def self.offer_matches(current_user)
    user_diploma = current_user.try(:diploma)
    user_availabilities = Availability
                              .joins(:user)
                              .select('date', 'time_slot')
                              .where(user_id: current_user.id)
                              .order(:date)
    offers = Offer.all
             .where('date >= ?', DateTime.now.to_date)
             .where('filled = ?', false)
             .joins(:center)
             .where(centers: {circonscription: current_user.circonscription})


    if offers.exists? && !user_diploma.nil?
      offers_diploma = offers.includes(:diplomas).where(diplomas: {name: user_diploma})

      matches = []

      user_availabilities.each do |user_availability|

        check_conditions = offers_diploma
                     .where(date: user_availability.date)
                     .includes(:slots).where(slots: {name: user_availability.time_slot})

        if !check_conditions.empty?
          check_conditions.each do |match|
              matches.push(match)
          end
        end
      end

    end

    return matches

  end

end
