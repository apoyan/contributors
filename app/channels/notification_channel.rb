class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notification:#{params[:job_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
