# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  gravatar_email         :string(255)
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :gravatar_email
  # attr_accessible :title, :body
  validates_presence_of :name, length: { maximum: 40 }
  validates_uniqueness_of :name, :email, :case_sensitive => false

  # Validates purdue campus email
  VALID_PURDUE_EMAIL_REGEX = /\A[\w+\-.]+@purdue\.edu/i
  validates :email, presence: true, 
                    format: { with: VALID_PURDUE_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
