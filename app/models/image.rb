class Image < ActiveRecord::Base
  # belongs_to :subject, polymorphic: true, foreign_key: :imageable # TRY THIS?
  belongs_to :imageable, polymorphic: true
  
  mount_uploader :src, ImageUploader
  
end
