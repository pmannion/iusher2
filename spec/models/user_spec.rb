require 'spec_helper'

describe User do

  before do
    @user = User.new(first_name:"paul",last_name:"mannion",profile_name:"paul",email:"me@mail.com")
  end

  subject { @user }

  it { should respond_to(:first_name)}
  it { should respond_to(:last_name)}
  it { should respond_to(:profile_name)}
  it { should respond_to(:email)}   #

  it { should be_valid}

  describe "when name is empty" do
    before { @user.first_name = ""}
    it { should_not be_valid}
  end
    describe "when email is empty" do
      before { @user.email = ""}
      it { should_not be_valid}
    end
      describe "when profile name is too long" do
        before { @user.profile_name = "a" * 31}
        it { should_not be_valid }
      end
  describe "when password is empty" do
    before { @user.password = ""}
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 5}
    it { should_not be_valid}
  end
end
