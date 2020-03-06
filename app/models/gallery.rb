class Gallery < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :text,  presence: true

  validates :image, presence: true

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  def previous_gallery
    Gallery.where("id<?",self.id).order("id DESC").first    
  end
  def next_gallery
    Gallery.where("id>?",self.id).order("id ASC").first
  end
end
