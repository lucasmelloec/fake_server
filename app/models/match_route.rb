class MatchRoute
  class MissingResource < StandardError; end

  include ActiveModel::Model

  attr_accessor :method, :fullpath, :code, :url_param

  validates :method, :fullpath, presence: true

  def initialize(attributes = {})
    super

    raise MissingResource, 'response' if response.blank?

    @code = response.code
  end

  def body
    original_body = response.body

    if @url_param.present?
      original_body.sub!("\#{#{expectation.url_param}}", @url_param)
    end

    JSON.parse(original_body)
  end

  private

  def domain
    @domain ||= Domain.all.find do |current_domain|
      path = current_domain.path
      @fullpath.start_with?("#{path}/") || @fullpath == path
    end
  end

  def expectation
    raise MissingResource, 'domain' if domain.blank?

    @expectation ||= Expectation.where(domain_id: domain.id, method:).find do |current_expectation|
      match_expectation(current_expectation)
    end
  end

  def match_expectation(current_expectation)
    path = domain.path + current_expectation.path

    if current_expectation.url_param?
      %r{\A#{path}/([^/\s]*)\z}.match(@fullpath) do |blabla|
        @url_param = blabla.captures&.first
      end
    else
      @fullpath == path
    end
  end

  def response
    raise MissingResource, 'expectation' if expectation.blank?

    @response ||= expectation.responses&.sample
  end
end
