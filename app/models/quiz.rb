class Quiz

  attr_reader :id, :label, :title, :questions

  def initialize(id, label, title, questions)
    @id = id
    @label = label
    @title = title
    @questions = questions || []
  end

end
