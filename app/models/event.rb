class Event < ActiveRecord::Base
  validates :name, :date, :location, :description,  { presence: true }
end
