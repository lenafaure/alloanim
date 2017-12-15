require 'rails_helper'

RSpec.describe "slots/show", type: :view do
  before(:each) do
    @slot = assign(:slot, Slot.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
