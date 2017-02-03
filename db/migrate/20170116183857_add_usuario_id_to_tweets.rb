class AddUsuarioIdToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :usuario_id, :integer
  end
end
