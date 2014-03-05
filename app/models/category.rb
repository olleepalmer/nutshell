class Category < ActiveRecord::Base

  has_many :posts, -> { order(updated_at: :desc) }

  validates :title, presence: true

end
