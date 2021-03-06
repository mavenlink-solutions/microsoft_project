require "active_support/concern"
require "active_support/core_ext/hash/keys"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/string/inflections"
require "nokogiri"
require "ruby-duration"

require "microsoft_project/version"

require "microsoft_project/concerns/element"
require "microsoft_project/concerns/deserialize"
require "microsoft_project/concerns/serialize"
require "microsoft_project/extended_attribute"
require "microsoft_project/timephased_data"
require "microsoft_project/resource"
require "microsoft_project/assignment"
require "microsoft_project/predecessor_link"
require "microsoft_project/task"
require "microsoft_project/project"
