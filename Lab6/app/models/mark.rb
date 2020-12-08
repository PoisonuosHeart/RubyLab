class Mark < ApplicationRecord
    belongs_to :report, dependent: :destroy

    validates :points, inclusion: {in: 0..100, message: "%{value} not in range [0; 100]"}
end
