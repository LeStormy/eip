class AddDescriptionAndSizeToFile < ActiveRecord::Migration[5.2]
  def change
    add_column :downloads, :file_size, :integer
    add_column :downloads, :description, :string
  end
end
