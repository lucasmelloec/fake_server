class DomainsController < ApplicationController
  before_action :set_domain, only: %i[show edit update destroy]

  # GET /domains or /domains.json
  def index
    @domains = Domain.all

    respond_with(@domains)
  end

  # GET /domains/1 or /domains/1.json
  def show
    respond_with(@domain)
  end

  # GET /domains/new
  def new
    @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains or /domains.json
  def create
    @domain = Domain.new(domain_params)

    flash[:notice] = 'Domain was successfully created.' if @domain.save

    respond_with(@domain)
  end

  # PATCH/PUT /domains/1 or /domains/1.json
  def update
    flash[:notice] = 'Domain was successfully updated.' if @domain.update(domain_params)
    respond_with(@domain)
  end

  # DELETE /domains/1 or /domains/1.json
  def destroy
    @domain.destroy!

    respond_with(@domain)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_domain
    @domain = Domain.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def domain_params
    params.require(:domain).permit(:name, :path)
  end
end
