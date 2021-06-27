class RenameFirstNameKamaColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name_kama, :first_name_kana
  end
end
