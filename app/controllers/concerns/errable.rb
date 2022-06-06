module Errable
  extend ActiveSupport::Concern

  included do
    class_attribute :model

    after_action :define_errors, only: :create
    before_action :retrieve_errors, only: :show
  end

  def retrieve_errors
    model = self.class.model
    errors_key = "#{model}_errors".to_sym

    unless session.key?(errors_key)
      return
    end

    model_instance = model.classify.constantize.new

    iterate_errors(model_instance, errors_key)
  end

  def define_errors
    model_name = self.class.model
    unless instance_variable_defined?("@#{model_name}")
      return
    end

    model_instance_errors = instance_variable_get("@#{model_name}").errors
    if model_instance_errors.any?
      errors_key = "#{model_name}_errors".to_sym
      session[errors_key] = model_instance_errors
    end
  end

  class_methods do
    def errable_model(model_symbol)
      self.model = model_symbol.to_s.downcase.pluralize(1)
    end
  end

  private

  def iterate_errors(model, errors_key)
    session[errors_key].each do |error_key, error_messages|
      error_messages.each do |error_message|
        model.errors.add(error_key, error_message)
      end
    end
    session.delete(errors_key)

    instance_variable_set("@#{self.class.model}", model)
  end
end
