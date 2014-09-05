class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, inverse_of: :users

  validates :name, :role_id, :presence => true
  validates :email, :uniqueness => true
  validate :role_exists

  private
    def role_exists
      unless Role.find_by(id: self.role_id)
        errors.add :role, 'not exists'
      end
    end
end
