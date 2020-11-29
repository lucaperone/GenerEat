class CreatePlannedDays < ActiveRecord::Migration[6.0]
  def change
    create_table :planned_days do |t|
      t.string :lunch
      t.string :dinner
      t.date :date

      t.timestamps
    end
  end
end
