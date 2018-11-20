class Weighin < ApplicationRecord
	validates_presence_of :weight
	validates_presence_of :date
end
