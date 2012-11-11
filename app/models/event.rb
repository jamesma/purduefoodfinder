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
#  category   :string(255)
#

class Event < ActiveRecord::Base
  # user_id attribute is not accessible
  attr_accessible :details, :name, :source, :where, :whendate, :whentime, :category

  validates :details,       presence: true,     length: { maximum: 500 }
  validates :name,          presence: true,     length: { maximum: 140 }
  validates :source,        presence: true,     length: { maximum: 250 }
  validates :whendate,      presence: true
  validates :whentime,      presence: true
  validates :user_id,       presence: true
  validates :where,         presence: true,     length: { maximum: 140 }
  validates :category,      presence: true,     length: { maximum: 20 }

  belongs_to :user
end
