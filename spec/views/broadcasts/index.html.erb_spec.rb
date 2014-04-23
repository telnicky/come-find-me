require 'spec_helper'

describe "broadcasts/index" do
  before(:each) do
    assign(:broadcasts, [
      stub_model(Broadcast,
        :user_id => 1,
        :sender_id => 2,
        :message_id => 3
      ),
      stub_model(Broadcast,
        :user_id => 1,
        :sender_id => 2,
        :message_id => 3
      )
    ])
  end

  it "renders a list of broadcasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
