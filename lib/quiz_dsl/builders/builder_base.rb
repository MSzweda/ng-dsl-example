module QuizDSL
  module Builders
    class BuilderBase
      include ActiveModel::Validations

      def build
        raise NotImplementedError
      end

      def object_key
        labels.compact.join('.')
      end

      private

      def labels
        raise NotImplementedError
      end

    end
  end
end
