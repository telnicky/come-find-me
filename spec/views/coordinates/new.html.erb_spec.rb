require 'spec_helper'

describe "coordinates/new" do
  before(:each) do
    assign(:coordinate, stub_model(Coordinate,
      :longitude => "9.99",
      :latitude => "9.99",
      :to_user => 1,
      :from_user => 1
    ).as_new_record)
  end

  it "renders new coordinate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coordinates_path, "post" do
      assert_select "input#coordinate_longitude[name=?]", "coordinate[longitude]"
      assert_select "input#coordinate_latitude[name=?]", "coordinate[latitude]"
      assert_select "input#coordinate_to_user[name=?]", "coordinate[to_user]"
      assert_select "input#coordinate_from_user[name=?]", "coordinate[from_user]"
    end
  end
end
