class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, :text, presence: true


  def previous
    Blog.where("id<?",self.id).order("id DESC").first    
  end
  def next
    Blog.where("id>?",self.id).order("id ASC").first
  end
end
