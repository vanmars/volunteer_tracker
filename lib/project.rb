class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    self.title == project_to_compare.title
  end

  def self.all
    projects = []
    returned_projects = DB.exec("SELECT * FROM projects;")
    returned_projects.each do |project|
      title = project.fetch('name')
      id = project.fetch('id').to_i
      projects << Project.new({title: title, id: id})
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

end