require 'rails_helper'

describe OffersController do

  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Offer to @offer" do
      get :new
      expect(assigns(:offer)).to be_a_new(Offer)
    end
  end

  describe "GET show" do
    let(:offer) { FactoryBot.create(:offer)}

    it "renders :show template" do
      get :show, id: offer.id
      expect(response).to render_template(:show)
    end

    it "assigns requested offer to @offer" do

    end

  end

end