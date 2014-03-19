class Category < ActiveRecord::Base

  has_many :posts, -> { order(updated_at: :desc) }, dependent: :destroy

  validates :title, presence: true

end
