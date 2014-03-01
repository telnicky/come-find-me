require 'spec_helper'

describe "coordinates/edit" do
  before(:each) do
    @coordinate = assign(:coordinate, stub_model(Coordinate,
      :longitude => 1,
      :latitude => 1,
      :to_user => 1,
      :from_user => 1
    ))
  end

  it "renders the edit coordinate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coordinate_path(@coordinate), "post" do
      assert_select "input#coordinate_longitude[name=?]", "coordinate[longitude]"
      assert_select "input#coordinate_latitude[name=?]", "coordinate[latitude]"
      assert_select "input#coordinate_to_user[name=?]", "coordinate[to_user]"
      assert_select "input#coordinate_from_user[name=?]", "coordinate[from_user]"
    end
  end
end
