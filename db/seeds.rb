# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Label.create([{name: 'Administration', color: '#2b72dc'}, {name: 'Analysis', color: '#2babd6'}, 
	{name: 'Requirement', color: '#ff8533'}, {name: 'Feature', color: '#ffad33'}, 
	{name: 'Design', color: '#9d2bd6'}, {name: 'Bug', color: '#ff3333'}, {name: 'Testing', color: '#ffff33'},
	{name: 'Chore', color: '#bceb2f'}, {name: 'Suggestion', color: '#2bd62b'}, {name: 'Learning', color: '#472bd6'},
	{name: 'Research', color: '#020118'}])

Status.create([{name: 'Backlog'}, {name: 'In progress'}, {name: 'Done'}])

Role.create([{name: 'Administrator'}, {name: 'Project Manager'}, {name: 'Developer'}, {name: 'Client'}])

ProjectStatus.create([{name: 'Starting'}, {name: 'In process'}, {name: 'Finished'}, {name: 'Cancel'}])

User.create({name: 'Usuario 3', email: 'usuario3@test.cl', password: 'blahblah'})
User.create({name: 'Usuario 2', email: 'usuario2@test.cl', password: 'blahblah'})
