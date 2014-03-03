require 'spec_helper'

describe "coordinates/show" do
  before(:each) do
    @coordinate = assign(:coordinate, stub_model(Coordinate,
      :longitude => "9.99",
      :latitude => "9.99",
      :to_user => 1,
      :from_user => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
