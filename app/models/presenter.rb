# == Schema Information
#
# Table name: presenters
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  twitter_handle :string
#  linked_in      :string
#  role           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
class Presenter < ApplicationRecord
  has_many :video_presenters
  has_many :videos, through: :video_presenters
  belongs_to :user

  def twitter_url
    "https://twitter.com/#{twitter_handle}" if !twitter_handle.blank?
  end
end
