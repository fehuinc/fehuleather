class Info < ActiveRecord::Base
  belongs_to :family

  validates :content, :family, :name, presence: true
end
