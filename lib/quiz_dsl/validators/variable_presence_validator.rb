module QuizDSL
  module Validators
    class VariablePresenceValidator < ::ActiveModel::Validator

      def validate(record)
        validate_instance_vars(record)
      end

      private

      def validate_instance_vars(record)
        options[:attributes].each do |varname|
          unless record.instance_variable_get("@#{varname}").present?
            record.errors.add("#{record.object_key}.#{varname}.variable", "missing")
          end
        end
      end

    end
  end
end
