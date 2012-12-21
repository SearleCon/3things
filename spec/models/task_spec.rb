require 'spec_helper'

describe Task do
    it "has a valid factory" do
      FactoryGirl.create(:task).should be_valid
    end

    it "is invalid without a title" do
      FactoryGirl.build(:task, title: nil).should_not be_valid
    end

    it "is invalid without a description" do
      FactoryGirl.build(:task, description: nil).should_not be_valid
    end

    it "is invalid without a status" do
      FactoryGirl.build(:task, status: nil).should_not be_valid
    end
end
