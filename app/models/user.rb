class User < ActiveRecord::Base

  has_many :posts, dependent: :nullify

  # Use friendly_id on Users
  extend FriendlyId
  friendly_id :friendify, use: :slugged

  # necessary to override friendly_id reserved words
  def friendify
    if username.downcase == "admin"
      "user-#{username}"
    else
      "#{username}"
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Pagination
  paginates_per 100

  # Validations
  # :username
  validates :username, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /\A[a-zA-Z0-9]*\z/, on: :create, message: "can only contain letters and digits"
  validates :username, length: { in: 4..20 }
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def self.paged(page_number)
    order(admin: :desc, username: :asc).page page_number
  end

  def self.search_and_order(search, page_number)
    if search
      where("username LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, username: :asc
      ).page page_number
    else
      order(admin: :desc, username: :asc).page page_number
    end
  end

  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","username","slug","created_at")
  end

  def self.last_signins(count)
    order(last_sign_in_at:
    :desc).limit(count).select("id","username","slug","last_sign_in_at")
  end

  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end

  def edit_count
    PaperTrail::Version.where(whodunnit: self.id.to_s).count
  end

  def recent_edits
    PaperTrail::Version.where(whodunnit: self.id.to_s).order(created_at: :desc).limit(10)
  end

  def recent_posts
    posts.order(created_at: :desc).limit(10)
  end

end
