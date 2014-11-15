module QuizDSL
  module Builders
    class AnswerOptionBuilder < BuilderBase

      def initialize(id, label, text)
        @id = id
        @label = label
        @text = text
      end

      def build
        ::AnswerOption.new(@id, @label, @text)
      end

    end
  end
end
