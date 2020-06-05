require "spec_helper"

describe MicrosoftProject::TimephasedData do
  describe "elements" do
    it { is_expected.to respond_to(:type).and respond_to(:type=) }
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:start).and respond_to(:start=) }
    it { is_expected.to respond_to(:finish).and respond_to(:finish=) }
    it { is_expected.to respond_to(:unit).and respond_to(:unit=) }
    it { is_expected.to respond_to(:value).and respond_to(:value=) }
  end

  describe "options" do
    let(:options) { described_class.element_options[element] }

    describe "type" do
      let(:element) { :type }

      it "has a custom options" do
        expect(options).to eq(type: :integer)
      end
    end

    describe "uid" do
      let(:element) { :uid }

      it "has a custom options" do
        expect(options).to eq(xml_name: "UID")
      end
    end

    describe "start" do
      let(:element) { :start }

      it "has custom options" do
        expect(options).to eq(type: :date_time)
      end
    end

    describe "finish" do
      let(:element) { :finish }

      it "has custom options" do
        expect(options).to eq(type: :date_time)
      end
    end

    describe "unit" do
      let(:element) { :unit }

      it "has custom options" do
        expect(options).to eq(type: :integer)
      end
    end
  end
end
