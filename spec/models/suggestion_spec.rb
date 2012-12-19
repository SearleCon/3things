require 'spec_helper'

describe Suggestion do

it "has a valid factory" do
    FactoryGirl.create(:suggestion).should be_valid
end

 it "is invalid without a subject" do
  FactoryGirl.build(:suggestion, subject: nil).should_not be_valid
 end

 it "is invalid without a suggestion" do
   FactoryGirl.build(:suggestion, suggestion: nil).should_not be_valid
 end

end
# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  suggestion :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

