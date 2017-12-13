class DashboardsController < ApplicationController
  def show
    @jobs = Job.all
    @company = Company.all
  end

end
