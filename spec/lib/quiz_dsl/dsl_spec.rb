require 'rails_helper'

describe QuizDSL::DSL do

  describe "#quiz" do

    context 'when quiz is valid' do

      let(:result) do
        subject.quiz(:quiz) do
          id 1
          title "a quiz"
          question :first_question do
            text "first question text"
            answer_option 1, :no, 'no'
            answer_option 2, :yes, 'yes'
            answer_option 3, :maybe, 'maybe'
          end
          question :second_question do
            text "second question text"
            answer_option 1, :no, 'no'
            answer_option 2, :yes, 'yes'
          end
        end
      end

      let(:quiz) { result.build }
      let(:first_question) { quiz.questions.first }
      let(:second_question) { quiz.questions[1] }

      it "returns builder object" do
        expect(result).to be_instance_of(QuizDSL::Builders::QuizBuilder)
      end

      it "returns builder object that constructs quiz with id" do
        expect(quiz.id).to eq(1)
      end

      it "returns builder object that constructs quiz with label" do
        expect(quiz.label).to eq(:quiz)
      end

      it "returns builder object that constructs quiz with title" do
        expect(quiz.title).to eq("a quiz")
      end

      it "returns the questions" do
        expect(quiz.questions.size).to eq(2)
      end

      it "returns builder object that constructs first defined question" do
        expect(first_question).to be_instance_of(Question)
        expect(first_question.id).to eq(1)
        expect(first_question.label).to eq :first_question
        expect(first_question.text).to eq("first question text")
        expect(first_question.answer_options.first).to be_instance_of(AnswerOption)
        expect(first_question.answer_options.size).to eq 3
      end

      it "returns builder object that constructs second defined question" do
        expect(second_question).to be_instance_of(Question)
        expect(second_question.id).to eq(2)
        expect(second_question.label).to eq :second_question
        expect(second_question.text).to eq("second question text")
        expect(second_question.answer_options.first).to be_instance_of(AnswerOption)
        expect(second_question.answer_options.size).to eq 2
      end

    end

  end
end
