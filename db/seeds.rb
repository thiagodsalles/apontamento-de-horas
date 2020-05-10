# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
manager_one = User.create(email: 'manager1@mail.com', password: '123456', password_confirmation: '123456', role: 'manager')
manager_two = User.create(email: 'manager2@mail.com', password: '123456', password_confirmation: '123456', role: 'manager')
collaborator = User.create(email: 'collaborator@mail.com', password: '123456', password_confirmation: '123456', role: 'collaborator')

#Teams
(1..3).each do |value|
  Team.create(name: "team-#{value}")
end

#manager_one to teams
(1..2).each do |value|
  UserTeam.create(team_id: Team.find_by(name: "team-#{value}").id, user_id: manager_one.id)
end

#manager_two to team
UserTeam.create(team_id: Team.find_by(name: "team-3").id, user_id: manager_two.id)

#Collaborators to team
UserTeam.create(team_id: Team.find_by(name: "team-2").id, user_id: collaborator.id)

#manager_one Tasks
Task.create(title: "task-1", status: 'doing', reason: nil, started_at: Time.now, finished_at: nil, user_id: manager_one.id, team_id: Team.first.id)
Task.create(title: "task-2", status: 'doing', reason: nil, started_at: Time.now, finished_at: nil, user_id: manager_one.id, team_id: Team.second.id)
Task.create(title: "task-3", status: 'done', reason: nil, started_at: Time.now, finished_at: Time.now, user_id: manager_one.id, team_id: Team.first.id)
Task.create(title: "task-4", status: 'done', reason: nil, started_at: Time.now, finished_at: Time.now, user_id: manager_one.id, team_id: Team.second.id)
Task.create(title: "task-5", status: 'canceled', reason: 'reason blablabla', started_at: Time.now, finished_at: Time.now, user_id: manager_one.id, team_id: Team.first.id)
Task.create(title: "task-6", status: 'canceled', reason: 'reason blablabla', started_at: Time.now, finished_at: Time.now, user_id: manager_one.id, team_id: Team.second.id)

#manager_two Tasks
Task.create(title: "task-1", status: 'doing', reason: nil, started_at: Time.now, finished_at: nil, user_id: manager_two.id, team_id: Team.third.id)
Task.create(title: "task-3", status: 'done', reason: nil, started_at: Time.now, finished_at: Time.now, user_id: manager_two.id, team_id: Team.third.id)
Task.create(title: "task-5", status: 'canceled', reason: 'reason blablabla', started_at: Time.now, finished_at: Time.now, user_id: manager_two.id, team_id: Team.third.id)


#Collaborator Tasks
Task.create(title: "task-7", status: 'doing', reason: nil, started_at: Time.now, finished_at: nil, user_id: collaborator.id, team_id: Team.second.id)
Task.create(title: "task-8", status: 'done', reason: nil, started_at: Time.now, finished_at: Time.now, user_id: collaborator.id, team_id: Team.second.id)
Task.create(title: "task-9", status: 'canceled', reason: 'reason blablabla', started_at: Time.now, finished_at: Time.now, user_id: collaborator.id, team_id: Team.second.id)