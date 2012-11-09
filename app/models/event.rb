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

class Event < ActiveRecord::Base
  attr_accessible :details, :name, :source, :time, :user_id, :when, :where

  belongs_to :user
end
