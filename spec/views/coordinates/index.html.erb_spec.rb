require 'spec_helper'

describe "coordinates/index" do
  before(:each) do
    assign(:coordinates, [
      stub_model(Coordinate,
        :longitude => 1,
        :latitude => 2,
        :to_user => 3,
        :from_user => 4
      ),
      stub_model(Coordinate,
        :longitude => 1,
        :latitude => 2,
        :to_user => 3,
        :from_user => 4
      )
    ])
  end

  it "renders a list of coordinates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end