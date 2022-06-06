class ExpectationsController < ApplicationController
  include Errable
  errable_model :expectation

  before_action :domain

  def create
    @expectation = @domain.expectations.build(expectation_params)

    flash[:notice] = 'Expectation was successfully created.' if @expectation.save

    respond_with([@domain, @expectation], location: domain_path(@domain), action: nil)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def domain
    @domain = Domain.find(params[:domain_id])
  end

  # Only allow a list of trusted parameters through.
  def expectation_params
    params.require(:expectation).permit(:path, :url_param, :method)
  end
end
