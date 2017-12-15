require 'rails_helper'

RSpec.describe "slots/edit", type: :view do
  before(:each) do
    @slot = assign(:slot, Slot.create!())
  end

  it "renders the edit slot form" do
    render

    assert_select "form[action=?][method=?]", slot_path(@slot), "post" do
    end
  end
end
