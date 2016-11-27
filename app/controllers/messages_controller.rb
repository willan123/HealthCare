class MessagesController < ApplicationController 
 skip_before_filter :verify_authenticity_token
 #skip_before_filter :authenticate_user!, :only => "reply"

  def index
  end

  def receive
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    if (message_body == "Critical" || message_body == "critical")
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Address - Barsha Ali - 880-645-3363 \nAddress - Dina Hasan - 880-334-4444 \nAddress - Hridi Chakma - 880-978-4425 \nAddress - Ojana Thakur - 880-623-7112"
      )
    elsif (message_body == "Schedule" || message_body == "schedule")
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Wednesday, November 28, 2016 - Address - Name - Third Trimester Check-Up \nWednesday, November 30, 2016 - Address - Name - Pre Birth Examination"
      )
    end
  end

  def sms
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: '+16136989868',
      body: "Example text send."
    )
    redirect_to(:back)
  end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
