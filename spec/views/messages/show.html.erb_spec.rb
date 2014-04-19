require 'spec_helper'

describe "location_requests/show" do
  before(:each) do
    @location_request = assign(:location_request, stub_model(LocationRequest,
      :user_id => 1,
      :location_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
