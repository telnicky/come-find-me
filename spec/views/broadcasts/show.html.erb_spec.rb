require 'spec_helper'

describe "broadcasts/show" do
  before(:each) do
    @broadcast = assign(:broadcast, stub_model(Broadcast,
      :user_id => 1,
      :sender_id => 2,
      :message_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
