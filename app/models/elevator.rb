require 'Send_SMS/SMS'
require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    has_many :interventions

    after_save :send_sms
    before_update :slack_notifier

    def send_sms
        if (self.saved_change_to_status? && self.status == "intervention")
            sms = SendSms::Sms.new
            sms.send_sms(self.id, self.column.battery.building.id, self.status)
        end
    end         
    
	def slack_notifier
    if self.status_changed?
      require 'date'
      current_time = DateTime.now.strftime("%d-%m-%Y %H:%M")
      notifier = Slack::Notifier.new ENV["SLACK_URL"]
      notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{current_time}."
    end
	end
end 

