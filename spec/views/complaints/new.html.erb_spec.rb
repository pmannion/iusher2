require 'spec_helper'

describe "complaints/new" do
  before(:each) do
    assign(:complaint, stub_model(Complaint,
      :branch => "MyString",
      :screen => 1,
      :seat => 1,
      :longitude => "9.99",
      :latittude => "9.99",
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new complaint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => complaints_path, :method => "post" do
      assert_select "input#complaint_branch", :name => "complaint[branch]"
      assert_select "input#complaint_screen", :name => "complaint[screen]"
      assert_select "input#complaint_seat", :name => "complaint[seat]"
      assert_select "input#complaint_longitude", :name => "complaint[longitude]"
      assert_select "input#complaint_latittude", :name => "complaint[latittude]"
      assert_select "input#complaint_comment", :name => "complaint[comment]"
    end
  end
end
