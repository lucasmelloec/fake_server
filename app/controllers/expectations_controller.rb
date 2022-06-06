class ExpectationsController < ApplicationController
  include Errable
  errable_model :expectation

  before_action :domain

  def create
    @expectation = @domain.expectations.build(expectation_params)

    respond_to do |format|
      if @expectation.save
        format.html { redirect_to domain_url(@domain), notice: "Expectation was successfully created." }
        format.json { render json: DomainSerializer.new(@domain).serializable_hash, status: :created }
      else
        format.html { redirect_to domain_url(@domain) }
        format.json { render json: @expectation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def domain
    @domain = Domain.find(params[:domain_id])
  end

  # Only allow a list of trusted parameters through.
  def expectation_params
    params.require(:expectation).permit(:path, :url_param)
  end
end
