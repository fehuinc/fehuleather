class Event < ApplicationRecord
  validates :name, :date, :location, { presence: true }
end
