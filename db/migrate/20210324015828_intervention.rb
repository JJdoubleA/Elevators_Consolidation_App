class Intervention < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author_id  
      t.references :customer, null:false
      t.references :building, null:false
      t.references :battery, null:true
      t.references :column, null:true
      t.references :elevator, null:true
      t.references :employee, null:true
      t.datetime :start_date
      t.datetime :end_date
      t.string :result
      t.text :report
      t.string :status
      

      t.timestamps
 
  end
   add_foreign_key :interventions, :employees, column: :author_id
   add_foreign_key :interventions, :customers, column: :customer_id
   add_foreign_key :interventions, :buildings, column: :building_id
   add_foreign_key :interventions, :batteries, column: :battery_id
   add_foreign_key :interventions, :columns, column: :column_id
   add_foreign_key :interventions, :elevators, column: :elevator_id
   add_foreign_key :interventions, :employees, column: :employee_id
  
end
end
