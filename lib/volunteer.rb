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
    
  end

end