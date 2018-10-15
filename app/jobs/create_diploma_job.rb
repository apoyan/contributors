class CreateDiplomaJob < Gush::Job
  def perform
    diploma = Diplomas::Contributor.new(params[:job_id], params[:name]).call

    NotificationChannel.broadcast_to(params[:job_id], id: "#contributor-#{params[:id]}", url: diploma.url)
  end
end