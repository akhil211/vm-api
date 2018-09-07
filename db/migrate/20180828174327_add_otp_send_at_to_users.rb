class AddOtpSendAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column  :users, :otp_send_at, :timestamp
  end
end
