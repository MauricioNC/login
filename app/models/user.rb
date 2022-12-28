class User < ApplicationRecord
  validates :name, length: {minimum:3, maximum:15}
  validates :name, presence: true, on: :create, message: "Name can't be blank"
  validates :name, unique: true, on: :create, message: "Name must be unique"

  validates :username, length: {minimum:8, maximum:16}
  validates :username, presence: true, on: :create, message: "Username can't be blank"
  validates :username, unique: true, on: :create, message: "Username must be unique"

  validates :password_digest, length: {minimum:8, maximum:16}
  validates :password_digest, presence: true, on: :create, message: "Password can't be blank"
  validates :password_digest, unique: true, on: :create, message: "Password must be unique"

  validates :password_confirmation, presence: true
  validates :password_confirmation, presence: true, on: :create, message: "Password confirmation can't be blank"
  validates :password_confirmation, unique: true, on: :create, message: "Password confirmation must be unique"
end
