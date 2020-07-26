class CreateVerifyEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :verify_emails do |t|

      t.timestamps
    end
  end
end
