require 'spec_helper'

describe "location_requests/edit" do
  before(:each) do
    @location_request = assign(:location_request, stub_model(LocationRequest,
      :user_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit location_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_request_path(@location_request), "post" do
      assert_select "input#location_request_user_id[name=?]", "location_request[user_id]"
      assert_select "input#location_request_location_id[name=?]", "location_request[location_id]"
    end
  end
end
