module QuizDSL
  module Builders
    class QuestionBuilder < BuilderBase

      def initialize(label)
        @label = label
        @answer_option_builders = []
      end

      def id(value)
        @id = value
      end

      def text(value)
        @text = value
      end

      def answer_option(id, label, text)
        builder = Builders::AnswerOptionBuilder.new(id, label, text)
        @answer_option_builders << builder
      end

      def build
        ::Question.new(@id, @label, @text, build_answer_options)
      end

      private

      def build_answer_options
        @answer_option_builders.map(&:build)
      end

    end
  end
end
