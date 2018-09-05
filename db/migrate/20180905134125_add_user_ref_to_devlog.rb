class AddUserRefToDevlog < ActiveRecord::Migration[5.2]
  def change
    add_reference :devlogs, :user, index: true
  end
end
