class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]

  def new
  end

  def create
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def show
  end



  private

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :phone, :address, :logo, :banner, :slogan, :description, :facebook, :twitter, :linkedin, :instagram)
  end
end
