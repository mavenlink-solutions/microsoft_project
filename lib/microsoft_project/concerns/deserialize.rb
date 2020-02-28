module MicrosoftProject
  module Concerns
    module Deserialize
      extend ActiveSupport::Concern

      class_methods do
        def from_xml(node)
          new.tap do |obj|
            node.element_children.each do |child|
              name = xml_names[child.name] || xml_names[child.name.pluralize]
              next unless name.present?

              if element_options[name][:flatten]
                value = obj.send(name) || []
                value << deserialize(child, name)
                obj.send("#{name}=", value)
              else
                obj.send("#{name}=", deserialize(child, name))
              end
            end
          end
        end

        private

        def deserialize(element, name)
          type = element_options[name][:type]

          if type == :date_time
            DateTime.strptime(element.inner_text, Serialize::XML_DATETIME_FORMAT)
          elsif type == :integer
            element.inner_text.to_i
          elsif type == :float
            element.inner_text.to_f
          elsif type == :boolean
            if element.inner_text == "1"
              true
            elsif element.inner_text == "0"
              false
            else
              raise "Invalid boolean value #{element.inner_text}"
            end
          elsif type == :decimal
            element.inner_text&.to_d
          elsif type == :duration
            Duration.new(element.inner_text) if element.inner_text.present?
          elsif type&.included_modules&.include?(Concerns::Deserialize)
            if element_options[name][:list] && !element_options[name][:flatten]
              element.element_children.map do |child|
                type.from_xml(child)
              end
            else
              type.from_xml(element)
            end
          else
            element.inner_text
          end
        end
      end
    end
  end
end
