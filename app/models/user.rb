class User < ActiveRecord::Base
  has_many :user_codes, dependent: :destroy
  has_many :commecos, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
