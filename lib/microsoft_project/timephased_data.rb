module MicrosoftProject
  class TimephasedData
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :type
    element :uid, xml_name: "UID"
    element :start
    element :end
    element :unit
    element :value
  end
end
