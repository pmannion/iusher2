require 'spec_helper'

describe "complaints/index" do
  before(:each) do
    assign(:complaints, [
      stub_model(Complaint,
        :branch => "Branch",
        :screen => 1,
        :seat => 2,
        :longitude => "9.99",
        :latittude => "9.99",
        :comment => "Comment"
      ),
      stub_model(Complaint,
        :branch => "Branch",
        :screen => 1,
        :seat => 2,
        :longitude => "9.99",
        :latittude => "9.99",
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of complaints" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Branch".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
