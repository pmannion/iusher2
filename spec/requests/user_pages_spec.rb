require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "sign up page" do
    before { visit signup_path}

    it { should have_selector('h1', text: "sign up") }

  end

  before { visit user_path(user)}
  it { should have_selector('h1', text: user.first_name)}
  end

