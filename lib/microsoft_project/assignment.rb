module MicrosoftProject
  class Assignment
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :uid, xml_name: "UID"
    element :task_uid, xml_name: "TaskUID"
    element :resource_uid, xml_name: "ResourceUID"
    element :finish, type: :date_time
    element :regular_work, type: :duration
    element :remaining_work, type: :duration
    element :start, type: :date_time
    element :units, type: :float
    element :work, type: :duration

    element :timephased_data, type: TimephasedData, list: true, flatten: true
  end
end
