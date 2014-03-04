require 'spec_helper'

describe "location_requests/index" do
  before(:each) do
    assign(:location_requests, [
      stub_model(LocationRequest,
        :user_id => 1,
        :location_id => 2
      ),
      stub_model(LocationRequest,
        :user_id => 1,
        :location_id => 2
      )
    ])
  end

  it "renders a list of location_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
