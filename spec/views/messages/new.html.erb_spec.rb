require 'spec_helper'

describe "location_requests/new" do
  before(:each) do
    assign(:location_request, stub_model(LocationRequest,
      :user_id => 1,
      :location_id => 1
    ).as_new_record)
  end

  it "renders new location_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_requests_path, "post" do
      assert_select "input#location_request_user_id[name=?]", "location_request[user_id]"
      assert_select "input#location_request_location_id[name=?]", "location_request[location_id]"
    end
  end
end
