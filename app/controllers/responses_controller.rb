class ResponsesController < ApplicationController
  before_action :set_response, only: %i[show edit update destroy]

  # GET /domains/1/expectations/1/responses
  def index
    @responses = expectation.responses
    respond_with(@responses)
  end

  # GET /domains/1/expectations/1/responses/1
  def show
    respond_with(@response)
  end

  # GET /domains/1/expectations/1/responses/new
  def new
    @response = expectation.responses.build
  end

  # GET /domains/1/expectations/1/responses/1/edit
  def edit
  end

  # POST /domains/1/expectations/1/responses
  def create
    @response = expectation.responses.build(response_params)

    flash[:notice] = 'Response was successfully created.' if @response.save
    respond_with(@response)
  end

  # PATCH/PUT /domains/1/expectations/1/responses/1
  def update
    flash[:notice] = 'Response was successfully updated.' if @response.update(response_params)
    respond_with(@response)
  end

  # DELETE /domains/1/expectations/1/responses/1
  def destroy
    @response.destroy!
    respond_with(@response)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find(params[:id])
  end

  def expectation
    @expectation ||= Expectation.find(params[:expectation_id])
  end

  # Only allow a list of trusted parameters through.
  def response_params
    params.require(:response).permit(:body, :format, :code, :expectation_id)
  end
end
