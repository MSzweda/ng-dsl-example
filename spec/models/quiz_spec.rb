require 'rails_helper'

describe Quiz do

  subject { described_class.new(1, :test_label, 'test title', []) }

  its(:id) { should eq(1) }
  its(:label) { should eq(:test_label) }
  its(:title) { should eq('test title') }
  its(:questions) { should eq([]) }

end
