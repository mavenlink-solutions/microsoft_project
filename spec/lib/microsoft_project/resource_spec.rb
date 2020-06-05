require "spec_helper"

describe MicrosoftProject::Resource do
  describe "elements" do
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:name).and respond_to(:name=) }
    it { is_expected.to respond_to(:type).and respond_to(:type=) }
    it { is_expected.to respond_to(:max_units).and respond_to(:max_units=) }

    it { is_expected.to respond_to(:extended_attributes).and respond_to(:extended_attributes=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "uid" do
        let(:element) { :uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "UID")
        end
      end

      describe "type" do
        let(:element) { :type }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "max_units" do
        let(:element) { :max_units }

        it "has custom options" do
          expect(options).to eq(type: :float)
        end
      end

      describe "extended_attributes" do
        let(:element) { :extended_attributes }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::ExtendedAttribute,
            list: true,
            flatten: true
          )
        end
      end
    end
  end
end
