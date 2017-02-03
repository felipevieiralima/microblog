class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :confirmation_token, :string
    add_column :usuarios, :confirmed_at, :datetime
    add_column :usuarios, :confirmation_sent_at, :datetime
    add_index :usuarios, :confirmation_token, unique: true
    execute("UPDATE usuarios SET confirmed_at = NOW()")
  end
end