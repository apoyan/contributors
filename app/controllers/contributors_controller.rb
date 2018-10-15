class ContributorsController < ApplicationController
  def index; end

  def search
    respond_to do |format|
      @contributions = GitHubAPI::Contributions.new(params[:url]).call

      if @contributions.valid? && @contributions.top_contributors.present?
        @flow = ContributorsWorkflow.create(@contributions.top_contributors)
        @flow.start!
        format.js { render :list }
      else
        format.js { render :errors }
      end
    end
  end
end