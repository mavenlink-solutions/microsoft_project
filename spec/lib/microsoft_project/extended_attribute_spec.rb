require "spec_helper"

describe MicrosoftProject::ExtendedAttribute do
  describe "elements" do
    it { is_expected.to respond_to(:field_id).and respond_to(:field_id=) }
    it { is_expected.to respond_to(:field_name).and respond_to(:field_name=) }
    it { is_expected.to respond_to(:value).and respond_to(:value=) }
    it { is_expected.to respond_to(:alias).and respond_to(:alias=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "field_id" do
        let(:element) { :field_id }

        it "has custom options" do
          expect(options).to eq(xml_name: "FieldID")
        end
      end
    end
  end
end
