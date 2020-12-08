class Report < ApplicationRecord
    #attr_accessor :mark, :mark_id
    has_many :marks

    validates :tittle, length: {minimum: 1, message: 'Your not input a tittle'}
    validates :description, length: {minimum: 1, message: 'Your not input a description'}
end
