require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:index)
end


get ('/projects') do
  if params["search"]
    @projects = Project.search(params[:search])
  elsif params["sort"]
    @projects = Project.sort()
  else
    @projects = Project.all
  end
  erb(:index)
end

post('/projects') do
  puts params
  project = Project.new({:title => params[:title], :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end

get('/projects/new') do
  erb(:new_project)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete
  @projects = Project.all()
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end


post('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title]})
  erb(:project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update({:title => params[:title]})
  @projects = Project.all
  erb(:projects)
end

# delete('/projects/:id') do
#   @project = Project.find(params[:id].to_i())
#   @project.delete()
#   @projects = Project.all
#   erb(:projects)
# end


get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

get ('projects/:id/volunteers') do
  if params["search"]
    @volunteers = Volunteer.search(params[:search])
  elsif params["sort"]
    @volunteers = Volunteer.sort()
  else
    @volunteers = Volunteer.all
  end
  @projects = Project.find(params[:id])
  erb(:volunteers)
end

post('/projects/:id/volunteers') do
  volunteer = Volunteer.new({:name => params[:name], :project_id => params[:id], :id => nil})
  volunteer.save()
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:volunteers)

end

#
# get('/volunteers/new') do
#   erb(:new_volunteer)
# end
#
# get('/volunteers/:id') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   erb(:volunteer)
# end
#
# post('/volunteers/:id') do
#   @volunteer = Volunteer.find(params[:id].to_i)
#   @volunteer.update(params[:name])
#   erb(:volunteer)
# end
#
# patch('/volunteers/:id') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   values = *params.values
#   @volunteer.update(params)
#   @volunteers = Volunteer.all
#   erb(:volunteers)
# end
#
# delete('/volunteers/:id') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   @volunteer.delete()
#   @volunteers = Volunteer.all
#   erb(:volunteers)
# end
#
# get('/volunteers/:id/edit') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   erb(:edit_volunteer)
# end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end
#
# # Get the detail for a specific song such as lyrics and songwriters.
# get('/volunteers/:id/songs/:song_id') do
#   @song = Song.find(params[:song_id].to_i())
#   erb(:song)
# end
#
# # Post a new song. After the song is added, Sinatra will route to the view for the volunteer the song belongs to.
# post('/volunteers/:id/songs') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   song = Song.new(:name => params[:song_name], :volunteer_id => @volunteer.id, :id => nil)
#   song.save()
#   erb(:volunteer)
# end
#
# # Edit a song and then route back to the volunteer view.
# patch('/volunteers/:id/songs/:song_id') do
#   @volunteer = Volunteer.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.update(params[:name], @volunteer.id)
#   erb(:volunteer)
# end
#
# # Delete a song and then route back to the volunteer view.
# delete('/volunteers/:id/songs/:song_id') do
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @volunteer = Volunteer.find(params[:id].to_i())
#   erb(:volunteer)
# end
