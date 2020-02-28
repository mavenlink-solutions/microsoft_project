module MicrosoftProject
  module Concerns
    module Serialize
      extend ActiveSupport::Concern

      XML_DATETIME_FORMAT = "%FT%T".freeze
      XML_DURATION_FORMAT = "PT%thH%mM%sS".freeze

      def xml_builder(root_name = base_xml_name, builder = Nokogiri::XML::Builder.new(encoding: "UTF-8"))
        builder.send(root_name, tags) do |xml|
          elements.each do |element, xml_name|
            serialize_element(xml, xml_name, element_options[element], attributes[element])
          end
        end
        builder
      end

      def as_json(_options = {})
        attributes.each_with_object({}) do |pair, hash|
          value = pair[1].is_a?(Duration) ? pair[1].format(XML_DURATION_FORMAT) : pair[1]
          hash[pair[0]] = value
        end
      end

      def to_xml
        xml_builder.to_xml.gsub(/(\r|\n)/, "\r\n")
      end

      def base_xml_name
        self.class.base_xml_name
      end

      def tags
        self.class.tags
      end

      class_methods do
        def base_xml_name
          name.demodulize
        end

        def tag(tag)
          @tags ||= {}
          @tags.merge!(tag)
        end

        def tags
          @tags
        end
      end

      private

      def serialize_element(xml, name, options, raw_value)
        case raw_value
        when DateTime
          value = raw_value.strftime(XML_DATETIME_FORMAT)
        when Array
          if options[:flatten]
            serialize_array(xml, raw_value)
          else
            xml.send(name) do |sub_xml|
              serialize_array(sub_xml, raw_value)
            end
          end
        when Concerns::Serialize
          raw_value.xml_builder(name, xml)
        when TrueClass
          value = 1
        when FalseClass
          value = 0
        when Duration
          value = raw_value.format(XML_DURATION_FORMAT)
        else
          value = raw_value
        end

        xml.send(name, value) if value.present?
      end

      def serialize_array(xml, raw_value)
        raw_value.each do |item|
          serialize_element(xml, item.class.name.demodulize, nil, item)
        end
      end
    end
  end
end
