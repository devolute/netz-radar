# require 'padrino-helpers/form_builder/abstract_form_builder'

module Padrino::Helpers::FormBuilder
  class CardBuilder < AbstractFormBuilder

    def statement_group(options={ }, &block)
      field = @object.id
      @object.statements.each do |s|
        @template.label_tag(field_id(s[:id]), options, &block)
        # @template.label_tag(field_id(field), options, &block)
        # @template.radio_button_tag(field_id(s[:id]))
      end
      # radio_button_group(:statement, :collection => @object.statements)
    end
  end
end
