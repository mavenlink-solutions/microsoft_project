require "spec_helper"

describe MicrosoftProject::PredecessorLink do
  describe "elements" do
    it { is_expected.to respond_to(:predecessor_uid).and respond_to(:predecessor_uid=) }
    it { is_expected.to respond_to(:type).and respond_to(:type=) }
    it { is_expected.to respond_to(:link_lag).and respond_to(:link_lag=) }
    it { is_expected.to respond_to(:lag_format).and respond_to(:lag_format=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "predecessor_uid" do
        let(:element) { :predecessor_uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "PredecessorUID")
        end
      end
    end
  end
end
