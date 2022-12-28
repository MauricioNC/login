class User < ApplicationRecord
  validates :name, length: {minimum:3, maximum:15}
  validates_presence_of :name, presence: true, on: :create, message: "Name can't be blank"
  validates_uniqueness_of :name, unique: true, on: :create, message: "Name must be unique"

  validates :username, length: {minimum:8, maximum:16}
  validates_presence_of :username, presence: true, on: :create, message: "Username can't be blank"
  validates_uniqueness_of :username, unique: true, on: :create, message: "Username must be unique"

  validates :password_digest, length: {minimum:8, maximum:16}
  validates_presence_of :password_digest, presence: true, on: :create, message: "Password can't be blank"
  validates_uniqueness_of :password_digest, unique: true, on: :create, message: "Password must be unique"

  validates :password_confirmation, presence: true
  validates_presence_of :password_confirmation, presence: true, on: :create, message: "Password confirmation can't be blank"
  validates_uniqueness_of :password_confirmation, unique: true, on: :create, message: "Password confirmation must be unique"

  has_secure_password
end
