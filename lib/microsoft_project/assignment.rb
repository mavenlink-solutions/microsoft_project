module MicrosoftProject
  class Assignment
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :uid, xml_name: "UID"
    element :task_uid, xml_name: "TaskUID"
    element :resource_uid, xml_name: "ResourceUID"
    element :remaining_work, type: :duration
    element :units, type: :float
    element :work, type: :duration
  end
end
