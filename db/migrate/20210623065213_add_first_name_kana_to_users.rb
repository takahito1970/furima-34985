class AddFirstNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_kama, :string
  end
end
