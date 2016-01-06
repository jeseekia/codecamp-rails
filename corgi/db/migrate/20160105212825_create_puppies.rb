class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.string :color #column
      t.string :owner, null: false #column
      t.text :description #column
      t.timestamps null: false
    end
  end
end
