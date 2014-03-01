require 'spec_helper'

describe "coordinates/show" do
  before(:each) do
    @coordinate = assign(:coordinate, stub_model(Coordinate,
      :longitude => 1,
      :latitude => 2,
      :to_user => 3,
      :from_user => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
