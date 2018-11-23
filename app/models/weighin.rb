class Weighin < ApplicationRecord
	validates :weight, presence: true, numericality: { greater_than: 0 }
	validates_presence_of :date
end
