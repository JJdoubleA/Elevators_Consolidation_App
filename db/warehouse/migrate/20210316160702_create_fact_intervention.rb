class CreateFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employee_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end

#rails g migration createIntervention author customer_id:integer buidling_id:integer
