module MicrosoftProject
  class ExtendedAttribute
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :field_id, xml_name: "FieldID"
    element :field_name
    element :value
    element :alias
  end
end
