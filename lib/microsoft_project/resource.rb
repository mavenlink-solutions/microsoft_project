module MicrosoftProject
  class Resource
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :uid, xml_name: "UID"
    element :name
    element :type, type: :integer
    element :max_units, type: :float

    element :extended_attributes, type: ExtendedAttribute, list: true, flatten: true
  end
end
