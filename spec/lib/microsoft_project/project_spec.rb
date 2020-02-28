require "spec_helper"

describe MicrosoftProject::Project do
  describe "tags" do
    it "has the required xml tags" do
      expect(subject.tags).to eq(
        xmlns: "http://schemas.microsoft.com/project/2007",
        "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
        "xsi:schemaLocation": "http://schemas.microsoft.com/project/2007 http://schemas.microsoft.com/project/2007/mspdi_pj12.xsd"
      )
    end
  end

  describe "elements" do
    it { is_expected.to respond_to(:save_version).and respond_to(:save_version=) }
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:name).and respond_to(:name=) }
    it { is_expected.to respond_to(:title).and respond_to(:title=) }
    it { is_expected.to respond_to(:manager).and respond_to(:manager=) }
    it { is_expected.to respond_to(:creation_date).and respond_to(:creation_date=) }
    it { is_expected.to respond_to(:last_saved).and respond_to(:last_saved=) }
    it { is_expected.to respond_to(:start_date).and respond_to(:start_date=) }
    it { is_expected.to respond_to(:finish_date).and respond_to(:finish_date=) }
    it { is_expected.to respond_to(:currency_digits).and respond_to(:currency_symbol=) }
    it { is_expected.to respond_to(:currency_symbol).and respond_to(:currency_digits=) }
    it { is_expected.to respond_to(:default_task_type).and respond_to(:default_task_type=) }
    it { is_expected.to respond_to(:default_standard_rate).and respond_to(:default_standard_rate=) }

    it { is_expected.to respond_to(:extended_attributes).and respond_to(:extended_attributes=) }
    it { is_expected.to respond_to(:tasks).and respond_to(:tasks=) }
    it { is_expected.to respond_to(:resources).and respond_to(:resources=) }
    it { is_expected.to respond_to(:assignments).and respond_to(:assignments=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "uid" do
        let(:element) { :uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "UID")
        end
      end

      describe "creation_date" do
        let(:element) { :creation_date }

        it "has custom options" do
          expect(options).to eq(type: :date_time)
        end
      end

      describe "last_saved" do
        let(:element) { :last_saved }

        it "has custom options" do
          expect(options).to eq(type: :date_time)
        end
      end

      describe "start_date" do
        let(:element) { :start_date }

        it "has custom options" do
          expect(options).to eq(type: :date_time)
        end
      end

      describe "finish_date" do
        let(:element) { :finish_date }

        it "has custom options" do
          expect(options).to eq(type: :date_time)
        end
      end

      describe "currency_digits" do
        let(:element) { :currency_digits }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "default_task_type" do
        let(:element) { :default_task_type }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "default_standard_rate" do
        let(:element) { :default_standard_rate }

        it "has custom options" do
          expect(options).to eq(type: :float)
        end
      end

      describe "extended_attributes" do
        let(:element) { :extended_attributes }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::ExtendedAttribute,
            list: true
          )
        end
      end

      describe "tasks" do
        let(:element) { :tasks }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::Task,
            list: true
          )
        end
      end

      describe "resources" do
        let(:element) { :resources }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::Resource,
            list: true
          )
        end
      end

      describe "assignments" do
        let(:element) { :assignments }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::Assignment,
            list: true
          )
        end
      end
    end
  end

  describe ".parse" do
    let(:xml) do
      <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <Project xmlns="http://schemas.microsoft.com/project/2007" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.microsoft.com/project/2007 http://schemas.microsoft.com/project/2007/mspdi_pj12.xsd">
          <UID>1</UID>
          <Title>Title</Title>
        </Project>
      XML
        .strip
    end

    it "parses xml" do
      project = described_class.parse(xml)
      expect(project).to be_a(described_class)
      expect(project.uid).to eq("1")
      expect(project.title).to eq("Title")
    end
  end
end
