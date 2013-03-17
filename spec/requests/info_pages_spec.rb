require 'spec_helper'

describe "InfoPages" do
  describe "about page" do

      it "should have content 'i usher'" do
    visit '/info_pages/about'
    page.should have_content('i Usher')
    end
  end
end

