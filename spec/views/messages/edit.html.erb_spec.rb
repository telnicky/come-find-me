require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :user_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", message_path(@message), "post" do
      assert_select "input#message_user_id[name=?]", "message[user_id]"
      assert_select "input#message_location_id[name=?]", "message[location_id]"
    end
  end
end
