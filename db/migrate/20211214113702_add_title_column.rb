class AddTitleColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :journeys, :title, :string
  end
end
