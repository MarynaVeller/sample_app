require 'spec_helper'

describe "User Pages" do
  
  subject {page}
  describe "Signup Page" do
    before {visit signup_path}
    it {should have_selector 'h1', text: "Sign Up"}
    it {should have_selector 'title', text: full_title("Sign Up")}
  end

	describe "profile page" do
	  # Code to make a user variable
	  let(:user) {FactoryGirl.create(:user)}
	  before { visit user_path(user) }

	  it { should have_selector('h1',    text: user.name) }
	  it { should have_selector('title', text: user.name) }
	end

	describe "sign up" do

		before {visit signup_path}
		let(:submit) {"Create my account"}

		describe "with invalid information" do
      		it "should not create a user" do
        		expect { click_button submit }.not_to change(User, :count)
      		end
      		before {click_button submit}
      		it "should contain error " do
      			should have_content ("error")
      		end

    	end	

		
		describe "with valid information" do
      		before do
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end	
		    it "should create a user" do
        		expect { click_button submit }.to change(User, :count).by(1)
        		should have_content ("Welcome")
        		should have_content(User.name) 
        		should have_link('Sign Out')
      		end

		end	


	end
end