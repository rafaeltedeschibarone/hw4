class EnsurePasswordDigestInUsers < ActiveRecord::Migration[8.1]
  def change
    unless column_exists?(:users, :password_digest)
      if column_exists?(:users, :password)
        rename_column :users, :password, :password_digest
      else
        add_column :users, :password_digest, :string
      end
    end
  end
end
