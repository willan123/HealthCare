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
        body: "200 University Ave - William Nippard - +16136989868 \n 151 Charles Street West - Jacob Willemsma - +15192220686"
      )
    elsif (message_body == "Schedule" || message_body == "schedule")
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Example schedule"
      )
    end
  end

  def sms
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: '+16136989868',
      body: "Textingggg"
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
