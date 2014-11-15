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

end
