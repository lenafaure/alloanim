require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @center = centers(:one)
    sign_in @center
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show offer" do
    get :show, params: {id: @offer.id}
    assert_response :success
  end

=begin
  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, params: { offer:
      { date: "2017-11-15",
        time_slot: "TAP",
        offer_number: 1,
        center_id: 1,
        school_id: 1,
        diplomas: [diplomas(:one), diplomas(:two)]
      }
    }
    end

    assert_redirected_to :show, params: {id: @offer.id}
  end
=end

=begin
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: {  } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: {  } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
=end
end
