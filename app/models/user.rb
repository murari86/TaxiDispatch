class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_length_of :password, :minimum => 8, :maximum => 40, :allow_blank => false,  :on => :create
  attr_accessible :first_name, :last_name, :phone_no, :country, :email, :password, :password_confirmation
  has_many :bookings
end
