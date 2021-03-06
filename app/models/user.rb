class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups , ->{order(updated_at: :DESC) }, through: :group_users
  has_many :group_users ,foreign_key: 'user_id'
  has_many :comments

end
