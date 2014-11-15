require 'rails_helper'

describe AnswerOption do

  subject { described_class.new(1, :test_label, 'test text') }

  its(:id) { should eq(1) }
  its(:label) { should eq(:test_label) }
  its(:text) { should eq('test text') }

end
