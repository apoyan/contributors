class ZipJob < Gush::Job
  def perform
    zip = Diplomas::Zipping.new(job_id).call
    id  = "#download-zip"

    NotificationChannel.broadcast_to(job_id, id: id, url: zip.url)
  end

  private

  def job_id
    params[:job_id]
  end
end