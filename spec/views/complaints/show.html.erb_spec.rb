require 'spec_helper'

describe "complaints/show" do
  before(:each) do
    @complaint = assign(:complaint, stub_model(Complaint,
      :branch => "Branch",
      :screen => 1,
      :seat => 2,
      :longitude => "9.99",
      :latittude => "9.99",
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Branch/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/Comment/)
  end
end
