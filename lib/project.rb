class Project
  attr_accessor :title, :id


  def initialize(attributes)
    @title = attributes.fetch(:title, nil)
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    returned_projects = DB.exec('SELECT * FROM projects;')
    projects = []
    returned_projects.each() do |project|
      title = project.fetch('title')
      id = project.fetch('id').to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.search(x)
    projects = Project.all
    projects.select {|e| /#{x}/i.match? e.title}
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:title => title, :id => id})
    else
      nil
    end
  end

  # def retitle(title)
  #   @title = title
  #   DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  # end

  def update(attributes)
  if (attributes.has_key?(:title)) && (attributes.fetch(:title) != nil)
    @title = attributes.fetch(:title)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  elsif (attributes.has_key?(:volunteer_title)) && (attributes.fetch(:volunteer_title) != nil)
    volunteer_title = attributes.fetch(:volunteer_title)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE lower(title)='#{volunteer_title.downcase}';").first
    if volunteer != nil
      DB.exec("INSERT INTO projects_volunteers (volunteer_id, project_id) VALUES (#{volunteer['id'].to_i}, #{@id});")
    end
  end
end

  def delete
    DB.exec("DELETE FROM projects_volunteers WHERE project_id = #{@id};")
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

  def self.sort()
    projects = Project.all
    projects.sort { |a, b| a.title <=> b.title }
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end

  def add_volunteer(volunteer_name)
  volunteer = Volunteer.search(volunteer_name).first
  DB.exec("INSERT INTO projects_volunteers (volunteer_id, project_id) VALUES (#{volunteer.id}, #{@id})")
end

#   def volunteers
#   volunteers = []
#   results = DB.exec("SELECT volunteer_id FROM projects_volunteers WHERE project_id = #{@id};")
#   results.each() do |result|
#     volunteer_id = result.fetch("volunteer_id").to_i()
#     volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{volunteer_id};")
#     name = volunteer.first().fetch("title")
#     volunteers.push(Volunteer.new({:name => name, :project_id => project.id, :id => volunteer_id}))
#   end
#   volunteers
# end


end
