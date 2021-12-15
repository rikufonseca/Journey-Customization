class RemoveUserIdFromJourneys < ActiveRecord::Migration[6.1]
  def change
    remove_column :journeys, :user_id, :string
  end
end
