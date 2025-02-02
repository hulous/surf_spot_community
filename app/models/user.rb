class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # validator: a user must have a uniq email
  validates :email, presence: true, uniqueness: true

  enum :role, {
    reader: "reader",
    writer: "writer",
    admin: "admin"
  }
end
