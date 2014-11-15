module QuizDSL
  module Builders
    class QuestionBuilder < BuilderBase
      validates_with QuizDSL::Validators::VariablePresenceValidator, attributes: [:id, :label, :text, :answer_option_builders]
      validates_with QuizDSL::Validators::NestedObjectValidator, attributes: [:answer_option_builders]

      def initialize(label, parent_labels)
        @label = label
        @parent_labels = parent_labels
        @answer_option_builders = []
      end

      def id(value)
        @id = value
      end

      def text(value)
        @text = value
      end

      def answer_option(id, label, text)
        builder = Builders::AnswerOptionBuilder.new(id, label, text, labels)
        @answer_option_builders << builder
      end

      def build
        ::Question.new(@id, @label, @text, build_answer_options)
      end

      private

      def build_answer_options
        @answer_option_builders.map(&:build)
      end

      def labels
        @parent_labels + [ @label ]
      end

    end
  end
end
