class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :user_teams
  has_many :teams, through: :user_teams

  validates :role, inclusion: { in: %w[collaborator manager] }

  scope :collaborators, -> { where(role: 'collaborator') }
  scope :managers, -> { where(role: 'manager') }
end
