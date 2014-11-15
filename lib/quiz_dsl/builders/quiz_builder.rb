module QuizDSL
  module Builders
    class QuizBuilder < BuilderBase

      def initialize(label)
        @label = label
        @question_builders = []
      end

      def id(value)
        @id = value
      end

      def title(value)
        @title = value
      end

      def question(label, &block)
        builder = QuestionBuilder.new(label)
        builder.id(@question_builders.size + 1)
        builder.instance_eval(&block)
        @question_builders << builder
      end

      def build
        ::Quiz.new(@id, @label, @title, build_questions)
      end

      private

      def build_questions
        @question_builders.map(&:build)
      end

    end
  end
end
