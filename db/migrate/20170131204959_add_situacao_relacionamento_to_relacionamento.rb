class AddSituacaoRelacionamentoToRelacionamento < ActiveRecord::Migration[5.0]
  def up
    add_column :relacionamentos, :situacao_relacionamento, :integer
  end

  def down
    remove_column :relacionamentos, :situacao_relacionamento, :integer, :null => false
  end
end
