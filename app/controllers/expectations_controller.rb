class ExpectationsController < ApplicationController
  before_action :set_expectation, only: %i[show edit update destroy]

  # GET /domains/1/expectations or /domains/1/expectations.json
  def index
    @expectations = domain.expectations
    respond_with(@expectations)
  end

  # GET /domains/1/expectations/1 or /domains/1/expectations/1.json
  def show
    respond_with(@expectation)
  end

  # GET /domains/1/expectations/new
  def new
    @expectation = domain.expectations.build
  end

  # GET /domains/1/expectations/1/edit
  def edit
  end

  # POST /domains/1/expectations or /domains/1/expectations.json
  def create
    @expectation = domain.expectations.build(expectation_params)

    flash[:notice] = 'Expectation was successfully created.' if @expectation.save

    respond_with(@expectation)
  end

  # PATCH/PUT /domains/1/expectations/1 or /domains/1/expectations/1.json
  def update
    flash[:notice] = 'Expectation was successfully updated.' if @expectation.update(expectation_params)
    respond_with(@expectation)
  end

  # DELETE /domains/1/expectations/1 or /domains/1/expectations/1.json
  def destroy
    @expectation.destroy!

    respond_with(@expectation)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expectation
    @expectation = Expectation.find(params[:id])
  end

  def domain
    @domain ||= Domain.find(params[:domain_id])
  end

  # Only allow a list of trusted parameters through.
  def expectation_params
    params.require(:expectation).permit(:path, :url_param, :method)
  end
end
