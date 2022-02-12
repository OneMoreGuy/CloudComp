class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  default_scope -> { includes(:user).order(created_at: :desc) }
  scope :by_tag, -> (branch, tag_name) do 
    joins(:tag).where(tags: {name: tag_name, branch: branch}) 
  end

  scope :by_branch, -> (branch) do
    joins(:tag).where(tags: {branch: branch}) 
  end

  scope :search, -> (search) do
    where("title LIKE lower(?) OR content LIKE lower(?)", "%#{search}%", "%#{search}%")
  end
  
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :content, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :tag_id, presence: true
end
