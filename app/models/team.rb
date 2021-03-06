class Team < ApplicationRecord
  has_many :user_teams
  has_many :tasks
  has_many :users, through: :user_teams

  validates_presence_of :name
end
