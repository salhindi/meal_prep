class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :password_digest
    end
  end
end
