class Volunteer
  attr_reader
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
  end

end