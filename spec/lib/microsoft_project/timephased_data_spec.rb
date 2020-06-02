require "spec_helper"

describe MicrosoftProject::TimephasedData do
  describe "elements" do
    it { is_expected.to respond_to(:type).and respond_to(:type=) }
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:start).and respond_to(:start=) }
    it { is_expected.to respond_to(:end).and respond_to(:end=) }
    it { is_expected.to respond_to(:unit).and respond_to(:unit=) }
    it { is_expected.to respond_to(:value).and respond_to(:value=) }
  end

  describe "options" do
    let(:options) { described_class.element_options[element] }

    describe "uid" do
      let(:element) { :uid }

      it "has a custom options" do
        expect(options).to eq(xml_name: "UID")
      end
    end
  end
end
