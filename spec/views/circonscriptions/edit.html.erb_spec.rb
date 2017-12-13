require 'rails_helper'

RSpec.describe "circonscriptions/edit", type: :view do
  before(:each) do
    @circonscription = assign(:circonscription, Circonscription.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit circonscription form" do
    render

    assert_select "form[action=?][method=?]", circonscription_path(@circonscription), "post" do

      assert_select "input[name=?]", "circonscription[name]"
    end
  end
end
