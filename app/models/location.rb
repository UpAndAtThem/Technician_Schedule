class Location < ApplicationRecord
  has_many :work_orders
  has_many :technition, through: :work_orders
end
