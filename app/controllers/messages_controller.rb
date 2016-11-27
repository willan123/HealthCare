class MessagesController < ApplicationController 
 skip_before_filter :verify_authenticity_token
 #skip_before_filter :authenticate_user!, :only => "reply"

  def index
  end

  def receive
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    if (message_body.downcase == "critical")
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "34 Jamalpur Street - Barsha Ali - 880-645-3363\n\n155 Halima Tower - Dina Hasan - 880-334-4444\n\n6572 Nizam Road - Hridi Chakma - 880-978-4425\n\n74 Koula Road - Ojana Thakur - 880-623-7112"
      )
    elsif (message_body.downcase == "schedule")
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Monday, November 28 at 12:30 - 1 Minto Road, Dhaka - Disha Das - Third Trimester Check-Up\n\nWednesday, November 30 at 8:30 - Jadabpur Berbari Community Clinic - Kwan Dutta - Pre Birth Examination\n\nMonday, December 5 - Krishnapur Community Clinic - Fahmida Barua - Due Date"
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
