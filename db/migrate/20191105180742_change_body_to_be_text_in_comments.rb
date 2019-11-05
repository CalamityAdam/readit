class ChangeBodyToBeTextInComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :body, :text
  end
end
