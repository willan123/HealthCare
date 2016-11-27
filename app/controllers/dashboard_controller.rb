class DashboardController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def schedule
  end

  def patients
    @patients = current_user.patients
  end
end
