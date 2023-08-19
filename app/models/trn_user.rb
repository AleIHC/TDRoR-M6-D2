class TrnUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trn_comments

  enum :role, [:trn_normal_user, :trn_admin]

  def role?(role_name)
    self.role == role_name
  end

end
