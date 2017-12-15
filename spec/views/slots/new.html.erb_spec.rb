require 'rails_helper'

RSpec.describe "slots/new", type: :view do
  before(:each) do
    assign(:slot, Slot.new())
  end

  it "renders new slot form" do
    render

    assert_select "form[action=?][method=?]", slots_path, "post" do
    end
  end
end
