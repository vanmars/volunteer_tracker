class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(volunteer_to_compare)
    if volunteer_to_compare != nil
      (self.name == volunteer_to_compare.name) && (self.project_id == volunteer_to_compare.project_id)
    else
      false
    end
  end

  def self.all
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    if returned_volunteers != nil
      returned_volunteers.each do |volunteer|
        name = volunteer.fetch('name')
        project_id = volunteer.fetch('project_id').to_i
        id = volunteer.fetch('id').to_i
        volunteers << Volunteer.new({name: name, project_id: project_id, id: id})
      end
    end
    volunteers
  end

  def save
    if (self.name != nil) && (self.project_id != nil)
      result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
      @id = result.first.fetch('id').to_i
    end
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      Volunteer.new({name: name, project_id: project_id, id: id})
    else
      nil
    end
  end

  def update(attributes)
    if attributes.has_key?(:name) && attributes.fetch(:name) != nil
      @name = attributes.fetch(:name)
      DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
    end
  end

  def self.search(search)
    results = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE name ILIKE '%#{search}%';")
    if returned_volunteers
      returned_volunteers.each do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      results << Volunteer.new({name: name, project_id: project_id, id: id})
      end
    end
    results
  end

  def delete 
    
  end


end