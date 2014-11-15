require 'rails_helper'

describe QuizDSL::Builders::QuestionBuilder do

  subject do
    described_class.new
  end

  describe '#build' do

    it 'returns question' do
      expect(subject.build).to be_instance_of(Question)
    end

    it "returns question with id" do
      subject.id 1
      expect(subject.build.id).to eq(1)
    end

    it "returns question with label" do
      subject.label :some_label
      expect(subject.build.label).to eq(:some_label)
    end

    it "returns question with text" do
      subject.text "a question"
      expect(subject.build.text).to eq("a question")
    end

    it "returns question answer option" do
      subject.answer_option 1, :some_option, 'some text'
      expect(subject.build.answer_options.first).to be_instance_of(AnswerOption)
    end

    it "builds options collection" do
      subject.answer_option 1, :some_option, 'some text'
      subject.answer_option 2, :some_other_option, 'some other text'
      expect(subject.build.answer_options.size).to eq 2
    end

  end

end
