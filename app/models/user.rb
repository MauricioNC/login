class User < ApplicationRecord
  has_secure_password

  validates :name, length: {minimum:3, maximum:15}
  validates_presence_of :name, presence: true, on: :create, message: "Name can't be blank"
  validates_uniqueness_of :name, unique: true, on: :create, message: "Name must be unique"

  validates :username, length: {minimum:8, maximum:16}
  validates_presence_of :username, presence: true, on: :create, message: "Username can't be blank"
  validates_uniqueness_of :username, unique: true, on: :create, message: "Username must be unique"

  validates :password, length: {minimum:8, maximum:16}, presence: true
end
