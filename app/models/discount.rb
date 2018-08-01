class Discount < ApplicationRecord
     validates :name, presence: true
     validates :quantity, presence: true
     validates :price, presence: true
     validates :typediscount, presence: true
     validates :unitdiscount, presence: true
end
