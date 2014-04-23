require 'spec_helper'

describe "broadcasts/new" do
  before(:each) do
    assign(:broadcast, stub_model(Broadcast,
      :user_id => 1,
      :sender_id => 1,
      :message_id => 1
    ).as_new_record)
  end

  it "renders new broadcast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", broadcasts_path, "post" do
      assert_select "input#broadcast_user_id[name=?]", "broadcast[user_id]"
      assert_select "input#broadcast_sender_id[name=?]", "broadcast[sender_id]"
      assert_select "input#broadcast_message_id[name=?]", "broadcast[message_id]"
    end
  end
end
