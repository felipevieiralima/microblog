class CreateRelacionamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :relacionamentos do |t|
      t.integer :seguidor_id
      t.integer :seguido_id

      t.timestamps
    end

    add_index :relacionamentos, :seguidor_id
    add_index :relacionamentos, :seguido_id
    add_index :relacionamentos, [:seguidor_id, :seguido_id], unique: true

  end
end
