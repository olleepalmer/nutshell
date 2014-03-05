class Post < ActiveRecord::Base

  has_paper_trail
  paginates_per 20

  belongs_to :category
  belongs_to :user

  validates :category, presence: true
  validates :user, presence: true

  def recent_siblings(n = 5)
    Post.where.not(id: self.id).where(category_id: self.category_id).order(updated_at: :desc).limit(n)
  end

  def full_title
    [category.title, title].join(" / ")
  end

  def category_title
    category.title
  end

  def content_length
    content.split(/\s+/).length rescue 0
  end

  def last_editor
    versions.count > 1 ?
      User.find(self.versions.last.whodunnit) : user
  end

end
