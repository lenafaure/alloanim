require 'test_helper'

class OfferTest < ActiveSupport::TestCase

  def setup
    @offer = offers(:one)
  end

  test "offer should be valid" do
    assert @offer.valid?
  end

  test "date should be present" do
    @offer.date = " "
    assert_not @offer.valid?
  end

  test "time_slot should be present" do
    @offer.time_slot = " "
    assert_not @offer.valid?
  end

  test "offer_number should be present" do
    @offer.offer_number = " "
    assert_not @offer.valid?
  end

  test "school_id" do
    @offer.school_id = " "
    assert_not @offer.valid?
  end

  test "center_id" do
    @offer.center_id = " "
    assert_not @offer.valid?
  end

end
