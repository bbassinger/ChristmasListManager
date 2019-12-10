class AddAnonymousChoiceToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :anonymous, :string
  end
end
