require 'spec_helper'

describe "coordinates/index" do
  before(:each) do
    assign(:coordinates, [
      stub_model(Coordinate,
        :longitude => "9.99",
        :latitude => "9.99",
        :to_user => 1,
        :from_user => 2
      ),
      stub_model(Coordinate,
        :longitude => "9.99",
        :latitude => "9.99",
        :to_user => 1,
        :from_user => 2
      )
    ])
  end

  it "renders a list of coordinates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
