# == Schema Information
#
# Table name: description_templates
#
#  id         :bigint           not null, primary key
#  template   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#  user_id    :bigint           not null
#
class DescriptionTemplate < ApplicationRecord
  has_many :videos
  belongs_to :user
end
