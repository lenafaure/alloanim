require 'rails_helper'

RSpec.describe "circonscriptions/new", type: :view do
  before(:each) do
    assign(:circonscription, Circonscription.new(
      :name => "MyString"
    ))
  end

  it "renders new circonscription form" do
    render

    assert_select "form[action=?][method=?]", circonscriptions_path, "post" do

      assert_select "input[name=?]", "circonscription[name]"
    end
  end
end
