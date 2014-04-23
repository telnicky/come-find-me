require 'spec_helper'

describe "broadcasts/edit" do
  before(:each) do
    @broadcast = assign(:broadcast, stub_model(Broadcast,
      :user_id => 1,
      :sender_id => 1,
      :message_id => 1
    ))
  end

  it "renders the edit broadcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcast_path(@broadcast), "post" do
      assert_select "input#broadcast_user_id[name=?]", "broadcast[user_id]"
      assert_select "input#broadcast_sender_id[name=?]", "broadcast[sender_id]"
      assert_select "input#broadcast_message_id[name=?]", "broadcast[message_id]"
    end
  end
end
