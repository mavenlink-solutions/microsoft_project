module MicrosoftProject
  class Project
    include Concerns::Element
    include Concerns::Serialize
    include Concerns::Deserialize

    tag xmlns: "http://schemas.microsoft.com/project/2007"
    tag "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance"
    tag "xsi:schemaLocation": "http://schemas.microsoft.com/project/2007 http://schemas.microsoft.com/project/2007/mspdi_pj12.xsd"

    element :save_version, type: :integer
    element :uid, xml_name: "UID"
    element :name
    element :title
    element :manager
    element :creation_date, type: :date_time
    element :last_saved, type: :date_time
    element :start_date, type: :date_time
    element :finish_date, type: :date_time
    element :currency_digits, type: :integer
    element :currency_symbol
    element :currency_code
    element :default_task_type, type: :integer
    element :default_standard_rate, type: :float

    element :extended_attributes, type: ExtendedAttribute, list: true
    element :tasks, type: Task, list: true
    element :resources, type: Resource, list: true
    element :assignments, type: Assignment, list: true

    def self.parse(raw)
      xml = Nokogiri.XML(raw) { |config| config.nonet.strict }
      raise "Root node name invalid: #{xml.root.name}" unless xml.root.name == base_xml_name

      from_xml(xml.root)
    end
  end
end
