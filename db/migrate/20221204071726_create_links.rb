class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.integer :clicks, default: 0

      t.timestamps
    end
  end
end
