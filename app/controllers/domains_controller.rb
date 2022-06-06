class DomainsController < ApplicationController
  include Errable
  errable_model :expectation

  before_action :set_domain, only: %i[show edit update destroy]

  # GET /domains or /domains.json
  def index
    @domains = Domain.all

    respond_to do |format|
      format.html
      format.json { render json: DomainSerializer.new(@domains).serializable_hash }
    end
  end

  # GET /domains/1 or /domains/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: DomainSerializer.new(@domain).serializable_hash, status: :ok }
    end
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

    respond_to do |format|
      if @domain.save
        format.html { redirect_to domain_url(@domain), notice: "Domain was successfully created." }
        format.json { render json: DomainSerializer.new(@domain).serializable_hash, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1 or /domains/1.json
  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to domain_url(@domain), notice: "Domain was successfully updated." }
        format.json { render json: DomainSerializer.new(@domain).serializable_hash, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1 or /domains/1.json
  def destroy
    @domain.destroy!

    respond_to do |format|
      format.html { redirect_to domains_url, notice: "Domain was successfully destroyed." }
      format.json { head :no_content }
    end
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
