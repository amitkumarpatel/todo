class Element < ApplicationRecord
  belongs_to :page

  validates :title, :content, presence: true
  validates :content, uniqueness: { scope: :page_id }

end
