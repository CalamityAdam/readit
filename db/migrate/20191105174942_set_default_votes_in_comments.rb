class SetDefaultVotesInComments < ActiveRecord::Migration[5.2]
  def change
    change_column_default :comments, :votes, from: nil, to: 0
  end
end
