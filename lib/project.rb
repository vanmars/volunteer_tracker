class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def ==(project_to_compare)
    if project_to_compare != nil
      self.title == project_to_compare.title
    else
      false
    end
  end

  def self.all
    projects = []
    returned_projects = DB.exec("SELECT * FROM projects ORDER BY name ASC;")
    if returned_projects != nil
      returned_projects.each do |project|
        title = project.fetch('name')
        id = project.fetch('id').to_i
        projects << Project.new({title: title, id: id})
      end
    end
    projects
  end

  def save
    if (self.title != nil) 
      result = DB.exec("INSERT INTO projects (name) VALUES ('#{@title}') RETURNING id;")
      @id = result.first.fetch('id').to_i
    end
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch('name')
      id = project.fetch('id').to_i
      Project.new({title: title, id: id})
    else
      nil
    end
  end

  def update(attributes)
    if attributes.has_key?(:title) && attributes.fetch(:title) != nil
      @title = attributes.fetch(:title)
      DB.exec("UPDATE projects SET name = '#{@title}' WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{@id}")    
  end

  def volunteers
    volunteers = []
    results = DB.exec("SELECT * from volunteers WHERE project_id = #{@id} ORDER BY name ASC;")
    if results != nil
      results.each do |result|
        name = result.fetch('name')
        id = result.fetch('id').to_i
        volunteers << Volunteer.new({name: name, project_id: @id, id: id})
      end
    end
    volunteers
  end

  def self.search(search)
    results = []
    returned_projects = DB.exec("SELECT * FROM projects WHERE name ILIKE '%#{search}%';")
    if returned_projects
      returned_projects.each do |project|
      title = project.fetch('name')
      id = project.fetch('id').to_i
      results << Project.new({title: title, id: id})
      end
    end
    results
  end

  def get_hours
    hours = 0
    result = DB.exec("SELECT SUM(hours) total FROM volunteers WHERE project_id = #{@id};").first
    if result
      hours = result.fetch('total').to_i
    end
    hours
  end
end