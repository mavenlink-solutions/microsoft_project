module MicrosoftProject
  module Concerns
    module Element
      extend ActiveSupport::Concern

      def attributes
        @attributes ||= {}
      end

      def attributes=(attributes)
        @attributes = attributes
      end

      def elements
        self.class.elements
      end

      def element_options
        self.class.element_options
      end

      class_methods do
        def elements
          @elements ||= {}
        end

        def xml_names
          elements.invert
        end

        def element_options
          @element_options ||= {}
        end

        def element(name, options = {})
          name_sym = name.to_sym
          element_options[name_sym] = options.symbolize_keys
          elements[name_sym] = element_options[name_sym][:xml_name] || name_sym.to_s.camelize

          define_method(name_sym) do
            attributes[name_sym]
          end

          define_method("#{name_sym}=") do |value|
            attributes[name_sym] = value
          end
        end
      end
    end
  end
end
