module MicrosoftProject
  class TimephasedData
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :type, type: :integer
    element :uid, xml_name: "UID"
    element :start, type: :date_time
    element :end, type: :date_time
    element :unit, type: :integer
    element :value
  end
end
