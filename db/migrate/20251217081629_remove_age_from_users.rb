class RemoveAgeFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :age, :string
  end
end
