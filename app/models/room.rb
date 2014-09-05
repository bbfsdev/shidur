class Room < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_in_rooms, autosave: true
  validates :name, presence: true
end
