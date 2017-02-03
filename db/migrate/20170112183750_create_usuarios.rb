class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|

      t.string :nome
      t.boolean :privado
      t.string :descricao

      t.timestamps
    end
  end
end
