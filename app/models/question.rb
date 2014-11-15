class Question

  attr_reader :id, :label, :text, :answer_options

  def initialize(id, label, text, answer_options)
    @id = id
    @label = label
    @text = text
    @answer_options = answer_options || []
  end

end
