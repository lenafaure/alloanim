require 'rails_helper'

RSpec.describe "circonscriptions/index", type: :view do
  before(:each) do
    assign(:circonscriptions, [
      Circonscription.create!(
        :name => "Name"
      ),
      Circonscription.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of circonscriptions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
