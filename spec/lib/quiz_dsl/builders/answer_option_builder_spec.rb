require 'rails_helper'

describe QuizDSL::Builders::AnswerOptionBuilder do

  subject do
    described_class.new(id, label, text, parent_labels)
  end

  let(:id) { 1 }
  let(:label) { :an_answer_option }
  let(:text) { "I'm an answer option" }
  let(:parent_labels) { [:quiz, :first_question] }

  describe '#build' do

    it 'returns answer option' do
      expect(subject.build).to be_instance_of(AnswerOption)
    end

  end

  describe '#object_key' do
    it 'returns object key built from labels' do
      expect(subject.object_key).to eq 'quiz.first_question.an_answer_option'
    end
  end

  describe '#valid?' do

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
        expect(subject.errors.full_messages).to eq ["Quiz first question an answer option id variable missing"]
      end
    end

    context 'when label is nil' do
      let(:label) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Quiz first question label variable missing"]
      end
    end

    context 'when text is nil' do
      let(:text) { nil }

      it 'returns false' do
        expect(subject.valid?).to eq false
      end

      it 'sets errors' do
        subject.valid?
        expect(subject.errors.full_messages).to eq ["Quiz first question an answer option text variable missing"]
      end
    end

  end

end
