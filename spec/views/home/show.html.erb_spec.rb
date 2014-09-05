require 'rails_helper'

RSpec.describe "/", :type => :view do
  before :each do
  end
  it "renders participant's page if user is group, haver or guest"
  it 'renders broadcast page if user is bcast'
  it 'renders initiator page if user is shidur'
  after :each do
  end
end
