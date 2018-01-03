class Call < ApplicationRecord
  # main class for the app
  # we don't actually need to do much extra with it.
  def update_twilio_status
    @twilio_call = Api::Twilio.get_call_data(self.twilio_sid)
    self.assign_attributes({
      status: @twilio_call.status,
      duration: @twilio_call.duration,
      opened_at: @twilio_call.start_time,
      closed_at: @twilio_call.end_time
    })
    self.save
  end

  def as_parsed_json
  end

end
