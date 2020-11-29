class CreateApiResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :api_responses do |t|
      t.string :key
      t.string :response

      t.timestamps
    end
  end
end
