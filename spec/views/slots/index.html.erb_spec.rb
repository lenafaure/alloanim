require 'rails_helper'

RSpec.describe "slots/index", type: :view do
  before(:each) do
    assign(:slots, [
      Slot.create!(),
      Slot.create!()
    ])
  end

  it "renders a list of slots" do
    render
  end
end
