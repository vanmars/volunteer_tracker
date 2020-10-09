require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  new_project = Project.new({title: title, id: nil})
  new_project.save
  redirect to('/projects')
end

get('/projects/:id') do
  erb(:project)
end

patch('/projects/:id') do
  redirect to('/projects/:id')
end