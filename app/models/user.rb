class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :ownerships
  has_many :owned_leagues, through: :ownerships, source: :league
end
