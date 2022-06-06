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

    if session.key?(errors_key)
      model_instance = model.classify.constantize.new

      session[errors_key].each do |error, error_messages|
        error_messages.each do |error_message|
          model_instance.errors.add(error, error_message)
        end
      end
      session.delete(errors_key)

      instance_variable_set("@#{model}", model_instance)
    end
  end

  def define_errors
    unless instance_variable_defined?("@#{self.class.model}")
      return
    end

    model_instance = instance_variable_get("@#{self.class.model}")
    if model_instance.errors.any?
      errors_key = "#{model_instance.class.name.downcase}_errors".to_sym
      session[errors_key] = model_instance.errors
    end
  end

  class_methods do
    def errable_model(model_symbol)
      self.model = model_symbol.to_s.downcase.pluralize(1)
    end
  end
end
