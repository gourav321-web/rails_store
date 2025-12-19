class Book < ApplicationRecord
	belongs_to :author , dependent: :destroy
end