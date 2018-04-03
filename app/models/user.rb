class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :senders, class_name: "Conversation", foreign_key: "sender_id"
  has_many :receivers, class_name: "Conversation", foreign_key: "receiver_id"
  scope :all_except, ->(user) { where.not(id: user) }

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

end
