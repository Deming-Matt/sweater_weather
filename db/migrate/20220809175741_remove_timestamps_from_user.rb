class RemoveTimestampsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :timestamps, :datatype
  end
end
