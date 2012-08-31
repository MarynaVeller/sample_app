require 'spec_helper'

describe "User Pages" do
  
  subject {page}
  describe "Signup Page" do
    before {visit root_path}
    it {should have_selector 'h1', text: "Sign Up"}
    it {should have_selector 'title', text: full_title("Sign Up")}
  end
end