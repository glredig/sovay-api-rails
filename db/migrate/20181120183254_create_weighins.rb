class CreateWeighins < ActiveRecord::Migration[5.2]
  def change
    create_table :weighins do |t|
    	t.decimal :weight
    	t.datetime :date 

      t.timestamps
    end
  end
end
