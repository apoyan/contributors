class ContributorsWorkflow < Gush::Workflow
  def configure(contributors)
    create_diplomas_jobs = contributors.map do |contributor|
      run CreateDiplomaJob, params: { id: contributor.id, name: contributor.name, job_id: id }
    end

    run ZipJob, params: { job_id: id }, after: create_diplomas_jobs
  end
end
