require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :user_id => 1,
      :location_id => 1
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messages_path, "post" do
      assert_select "input#message_user_id[name=?]", "message[user_id]"
      assert_select "input#message_location_id[name=?]", "message[location_id]"
    end
  end
end
