require 'rails_helper'

RSpec.describe User, :type => :model do
  before :all do
    %w[root bcast shidur moder group haver guest].each do |r|
      Role.create name: r
    end
    @root = Role.find_by(name: 'root')
    @group = Role.find_by(name: 'group')
    @haver = Role.find_by(name: 'haver')

    ibrahim = User.create name: 'Ибрагим', role: @haver, email: 'ibrahim@mail.ru', password: '1234567890'
  end

  it 'is valid with name, password, unique email and role' do
    u = User.new name: 'Жмеринка', role: @group, email: 'jjj333@mail.ru', password: '1234567890'
    expect(u).to be_valid
  end
  it 'is invalid without name' do
    u = User.new name: nil, role: @group, email: 'jjj333@mail.ru', password: '1234567890'
    expect(u).to_not be_valid
  end
  it 'is invalid without unique email' do
    u = User.new name: 'Жмеринка', role: @group, email: nil, password: '1234567890'
    expect(u).to_not be_valid
    u.email = 'ibrahim@mail.ru'
    expect(u).to_not be_valid
  end
  it 'is invalid without password' do
    u = User.new name: 'Жмеринка', role: @group, email: 'jjj333@mail.ru'
    expect(u).to_not be_valid
  end
  it 'is invalid with short password' do
    u = User.new name: 'Жмеринка', role: @group, email: 'jjj333@mail.ru', password: '1234'
    expect(u).to_not be_valid
  end
  it 'is invalid without role' do
    u = User.new name: 'Жмеринка', role: nil, email: 'jjj333@mail.ru', password: '1234567890'
    expect(u).to_not be_valid
  end
  after :all do 
    Role.all.each{|r| r.destroy }
  end
end
