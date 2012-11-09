# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  details    :text
#  where      :string(255)
#  source     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  whendate   :date
#  whentime   :time
#

require 'spec_helper'

describe Event do

  before(:each) do
    @attr = { 
      :name => "Example User",
      :details => "user@purdue.edu",
      :where => "foobar",
      :source => "foobar",
      :whendate => "2012-11-08",
      :whentime => "2012-11-08 22:39:03"
    }
  end

  let(:user) { FactoryGirl.create(:user) }
  before { @event = user.events.build(@attr) }

  subject { @event }
  it { should respond_to(:name) }
  it { should respond_to(:details) }
  it { should respond_to(:where) }
  it { should respond_to(:source) }
  it { should respond_to(:whendate) }
  it { should respond_to(:whentime) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @event.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Event.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank name" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "with blank details" do
    before { @event.details = " " }
    it { should_not be_valid }
  end

  describe "with blank where" do
    before { @event.where = " " }
    it { should_not be_valid }
  end

  describe "with blank source" do
    before { @event.source = " " }
    it { should_not be_valid }
  end

  describe "with blank whendate" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "with blank whentime" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @event.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "with details that is too long" do
    before { @event.name = "a" * 251 }
    it { should_not be_valid }
  end

  describe "with source that is too long" do
    before { @event.name = "a" * 251 }
    it { should_not be_valid }
  end

  describe "with where that is too long" do
    before { @event.name = "a" * 141 }
    it { should_not be_valid }
  end

end
