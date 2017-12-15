require 'rails_helper'

RSpec.describe "Slots", type: :request do
  describe "GET /slots" do
    it "works! (now write some real specs)" do
      get slots_path
      expect(response).to have_http_status(200)
    end
  end
end
