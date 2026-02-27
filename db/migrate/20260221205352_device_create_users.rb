# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
<<<<<<< HEAD:db/migrate/20260221205352_devise_create_users.rb
 def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
=======
  def change
  create_table :messages do |t|
  t.text :content
  t.references :trip, null: false, foreign_key: true
  t.references :user, null: false, foreign_key: true

  t.timestamps
end


      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
>>>>>>> 0b2d81ffcac17fde834c16aaf9a0ea46136bd888:db/migrate/20260221205352_device_create_users.rb
