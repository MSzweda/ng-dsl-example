require 'rails_helper'

describe QuizDSL::Builders::QuizBuilder do

  subject do
    described_class.new(label)
  end

  let(:label) { :some_label }

  describe '#build' do

    it 'returns quiz' do
      expect(subject.build).to be_instance_of(Quiz)
    end

    it "returns quiz with id" do
      subject.id 1
      expect(subject.build.id).to eq(1)
    end

    it "returns quiz with label" do
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

  describe '#object_key' do
    it 'returns object key built from labels' do
      expect(subject.object_key).to eq 'some_label'
    end
  end

  describe '#valid?' do

    let(:id) { 1 }
    let(:title) { "I'm a quiz" }
    let(:question) do
      subject.question :some_question do
        text "I'm a question"
        answer_option 1, :hello, "hello"
      end
    end

    before do
      subject.id id
      subject.title title
      question
    end

    context 'when all data is set' do
      it 'returns true' do
        expect(subject.valid?).to eq true
      end
    end

    context 'when id is nil' do
      let(:id) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Some label id variable missing"]
      end
    end

    context 'when label is nil' do
      let(:label) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq [" label variable missing"]
      end
    end

    context 'when title is nil' do
      let(:title) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Some label title variable missing"]
      end
    end

    context 'when no question is defined' do
      let(:question) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Some label question builders variable missing"]
      end
    end

    context 'when question is invalid' do
      let(:question) do
      subject.question :some_question do
          answer_option 1, :hello, "hello"
        end
      end

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Some label some question text variable missing"]
      end
    end

  end

end
