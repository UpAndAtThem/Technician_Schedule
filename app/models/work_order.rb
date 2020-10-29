class WorkOrder < ApplicationRecord
  belongs_to :location
  belongs_to :technition
end
