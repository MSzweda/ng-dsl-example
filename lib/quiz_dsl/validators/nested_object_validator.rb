module QuizDSL
  module Validators
    class NestedObjectValidator < ::ActiveModel::Validator

      def validate(record)
        validate_nested_objects(record)
      end

      private

      def validate_nested_objects(record)
        options[:attributes].each do |varname|
          collection = record.instance_variable_get("@#{varname}")
          collection.all?(&:valid?)
          add_errors_from_nested_objects(record, collection)
        end
      end

      def add_errors_from_nested_objects(record, collection)
        collection.each do |object|
          object.errors.messages.each do |key, message_array|
            message_array.each do |message|
              record.errors.add(key, message)
            end
          end
        end
      end

    end
  end
end
