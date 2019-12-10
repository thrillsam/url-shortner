class CreateUrlInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :url_infos do |t|
      t.string :ip_address
      t.string :country
      t.integer :url_id

      t.timestamps
    end
  end
end
