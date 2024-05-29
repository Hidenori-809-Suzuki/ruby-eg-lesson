# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  author_name :string(255)
#  body        :text(65535)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Board < ApplicationRecord
  has_many :comments
  
  validates :author_name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
