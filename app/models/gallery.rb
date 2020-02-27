class Gallery < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def previous_gallery
    Gallery.where("id<?",self.id).order("id DESC").first    
  end
  def next_gallery
    Gallery.where("id>?",self.id).order("id ASC").first
  end
end
