class WarehouseRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :"dwh_development"
end


#establish_connection :"warehouse_#{Rails.env}"