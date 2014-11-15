require 'rails_helper'

describe QuizDSL::Builders::QuizBuilder do

  subject do
    described_class.new
  end

  describe '#build' do

    it 'returns quiz' do
      expect(subject.build).to be_instance_of(Quiz)
    end

    it "returns quiz with id" do
      subject.id 1
      expect(subject.build.id).to eq(1)
    end

    it "returns quiz with label" do
      subject.label :some_label
      expect(subject.build.label).to eq(:some_label)
    end

    it "returns quiz with title" do
      subject.title "a quiz"
      expect(subject.build.title).to eq("a quiz")
    end

    it "returns quiz question" do
      subject.question :hi_there do
        text 'some text'
        answer_option 1, :some_label, 'some text again'
      end
      expect(subject.build.questions.first).to be_instance_of(Question)
    end

    it "builds question collection" do
      subject.question :a do
      end
      subject.question :b do
      end
      expect(subject.build.questions.size).to eq 2
    end

    it "sets consecutive ids on questions" do
      subject.question :a do
      end
      subject.question :b do
      end
      expect(subject.build.questions.map(&:id)).to eq([1, 2])
    end

  end

end
