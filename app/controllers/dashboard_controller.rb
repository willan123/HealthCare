class DashboardController < ApplicationController
  # before_action :authenticate_user!

  def index
    @patients = current_user.patients
    @low_risk = @patients.where(:condition => 0).count
    @mild_risk = @patients.where(:condition => 1).count
    @critical = @patients.where(:condition => 2).count
    @seen = @patients.where(:seen => true).count
  end

  def schedule
  end

  def patients
    @patients = current_user.patients
  end
end
