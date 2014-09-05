require 'rails_helper'

RSpec.describe "Home", :type => :request do
  describe "GET /" do
    it "should show login page if not logged in"
    it "redirects roles: group and haver to participant page"
    it "redirects role bcast to broadcast page"
    it "redirects role shidur to initiator page"
    it "only root can manage users"
    it "user (not root) can change only his pass and email"
    it "group and haver can see only participant page"
    it "bcast can see only broadcast page"
    it "shidur can see broadcast and shidur page"
  end
end
