module MicrosoftProject
  class PredecessorLink
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :predecessor_uid, xml_name: "PredecessorUID"
    element :type, type: :integer
    element :link_lag, type: :integer
    element :lag_format, type: :integer
  end
end
