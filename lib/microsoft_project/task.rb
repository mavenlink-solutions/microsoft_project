module MicrosoftProject
  class Task
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    element :uid, xml_name: "UID"
    element :name
    element :wbs, xml_name: "WBS"
    element :outline_number
    element :outline_level, type: :integer
    element :priority, type: :integer
    element :start, type: :date_time
    element :finish, type: :date_time
    element :duration, type: :duration
    element :duration_format, type: :integer
    element :work, type: :duration
    element :milestone, type: :boolean
    element :percent_complete, type: :integer
    element :percent_work_complete, type: :integer
    element :cost, type: :decimal
    element :remaining_duration, type: :duration
    element :notes

    element :predecessor_links, type: PredecessorLink, list: true, flatten: true
    element :extended_attributes, type: ExtendedAttribute, list: true, flatten: true
  end
end
