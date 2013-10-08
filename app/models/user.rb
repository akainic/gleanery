class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  attr_accessor :login

  validates_presence_of :username
  validates_uniqueness_of :username,
    :case_sensitive => false

  validates_format_of :email,
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_format_of :password,
    with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,128}/

  has_many :ratings,
    inverse_of: :user,
    dependent: :nullify

  has_many :comments,
    inverse_of: :user,
    dependent: :nullify

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase}]).first
    else
      where(conditions).first
    end
  end
end