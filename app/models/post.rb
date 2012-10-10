class Post < ActiveRecord::Base
  attr_accessible :body, :published, :published_at, :title, :abstract

  validate :permalink_uniqueness

  before_create :generate_permalink

  scope :published, where(:published => true).order("published_at DESC")
  
  def generate_permalink
    self.permalink = self.title.parameterize unless self.permalink.present?
  end

  def permalink_uniqueness
    if Post.find_by_permalink(self.title.parameterize)
      errors[:base] << "This title has been already used, please change it." unless permalink
    end
  end

  def to_param
    self.permalink
  end

end
