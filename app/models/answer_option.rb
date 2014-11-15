class AnswerOption

  attr_reader :id, :label, :text

  def initialize(id, label, text)
    @id = id
    @label = label
    @text = text
  end

end
