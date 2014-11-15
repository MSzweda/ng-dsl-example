require 'rails_helper'

describe QuizDSL::Builders::AnswerOptionBuilder do

  subject do
    described_class.new(id, label, text)
  end

  let(:id) { 1 }
  let(:label) { :an_answer_option }
  let(:text) { "I'm an answer option" }

  describe '#build' do

    it 'returns answer option' do
      expect(subject.build).to be_instance_of(AnswerOption)
    end

  end

end
