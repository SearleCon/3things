require 'spec_helper'

describe StatusHistory do
  it "has a valid factory" do
    FactoryGirl.create(:status_history).should be_valid
  end

  it "is invalid without a task_id" do
    FactoryGirl.build(:status_history, task_id: nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:status_history, status_id: nil).should_not be_valid
  end
end
