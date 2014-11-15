module QuizDSL
  class DSL

    def quiz(label, &block)
      builder = Builders::QuizBuilder.new(label)
      builder.instance_eval(&block)
      builder
    end

  end
end
