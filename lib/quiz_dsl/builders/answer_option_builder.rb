module QuizDSL
  module Builders
    class AnswerOptionBuilder < BuilderBase

      def initialize(id, label, text, parent_labels)
        @id = id
        @label = label
        @text = text
        @parent_labels = parent_labels
      end

      def build
        ::AnswerOption.new(@id, @label, @text)
      end

      private

      def labels
        @parent_labels + [ @label ]
      end

    end
  end
end
