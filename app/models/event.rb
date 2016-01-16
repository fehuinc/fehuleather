class Event < ActiveRecord::Base
  validates :name, :date, :location, { presence: true }
end
