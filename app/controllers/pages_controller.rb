class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def about
    @company = Company.find(params[:id])
  end
end
