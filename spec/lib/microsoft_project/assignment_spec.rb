require "spec_helper"

describe MicrosoftProject::Assignment do
  describe "elements" do
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:task_uid).and respond_to(:task_uid=) }
    it { is_expected.to respond_to(:resource_uid).and respond_to(:resource_uid=) }
    it { is_expected.to respond_to(:remaining_work).and respond_to(:remaining_work=) }
    it { is_expected.to respond_to(:units).and respond_to(:units=) }
    it { is_expected.to respond_to(:work).and respond_to(:work=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "uid" do
        let(:element) { :uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "UID")
        end
      end

      describe "task_uid" do
        let(:element) { :task_uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "TaskUID")
        end
      end

      describe "resource_uid" do
        let(:element) { :resource_uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "ResourceUID")
        end
      end

      describe "remaining_work" do
        let(:element) { :remaining_work }

        it "has custom options" do
          expect(options).to eq(type: :duration)
        end
      end

      describe "units" do
        let(:element) { :units }

        it "has custom options" do
          expect(options).to eq(type: :float)
        end
      end

      describe "work" do
        let(:element) { :work }

        it "has custom options" do
          expect(options).to eq(type: :duration)
        end
      end

      describe "timephased_data" do
        let(:element) { :timephased_data }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::TimephasedData,
            list: true,
            flatten: true
          )
        end
      end
    end
  end
end
