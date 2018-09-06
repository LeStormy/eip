class CreateDownloads < ActiveRecord::Migration[5.2]
  def change
    create_table :downloads do |t|
      t.string :kind
      t.string :name
      t.string :file

      t.timestamps
    end
  end
end
