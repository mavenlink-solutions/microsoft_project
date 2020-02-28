require "spec_helper"

describe MicrosoftProject::Task do
  describe "elements" do
    it { is_expected.to respond_to(:uid).and respond_to(:uid=) }
    it { is_expected.to respond_to(:name).and respond_to(:name=) }
    it { is_expected.to respond_to(:wbs).and respond_to(:wbs=) }
    it { is_expected.to respond_to(:outline_number).and respond_to(:outline_number=) }
    it { is_expected.to respond_to(:outline_level).and respond_to(:outline_level=) }
    it { is_expected.to respond_to(:priority).and respond_to(:priority=) }
    it { is_expected.to respond_to(:start).and respond_to(:start=) }
    it { is_expected.to respond_to(:finish).and respond_to(:finish=) }
    it { is_expected.to respond_to(:duration).and respond_to(:duration=) }
    it { is_expected.to respond_to(:duration_format).and respond_to(:duration_format=) }
    it { is_expected.to respond_to(:work).and respond_to(:work=) }
    it { is_expected.to respond_to(:milestone).and respond_to(:milestone=) }
    it { is_expected.to respond_to(:percent_complete).and respond_to(:percent_complete=) }
    it { is_expected.to respond_to(:percent_work_complete).and respond_to(:percent_work_complete=) }
    it { is_expected.to respond_to(:cost).and respond_to(:cost=) }
    it { is_expected.to respond_to(:remaining_duration).and respond_to(:remaining_duration=) }
    it { is_expected.to respond_to(:notes).and respond_to(:notes=) }

    it { is_expected.to respond_to(:predecessor_links).and respond_to(:predecessor_links=) }
    it { is_expected.to respond_to(:extended_attributes).and respond_to(:extended_attributes=) }

    describe "options" do
      let(:options) { described_class.element_options[element] }

      describe "uid" do
        let(:element) { :uid }

        it "has custom options" do
          expect(options).to eq(xml_name: "UID")
        end
      end

      describe "wbs" do
        let(:element) { :wbs }

        it "has custom options" do
          expect(options).to eq(xml_name: "WBS")
        end
      end

      describe "outline_level" do
        let(:element) { :outline_level }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "priority" do
        let(:element) { :priority }

        it "has custom options" do
          expect(options).to eq(type: :integer)
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

      describe "duration" do
        let(:element) { :duration }

        it "has custom options" do
          expect(options).to eq(type: :duration)
        end
      end

      describe "duration_format" do
        let(:element) { :duration_format }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "work" do
        let(:element) { :work }

        it "has custom options" do
          expect(options).to eq(type: :duration)
        end
      end

      describe "milestone" do
        let(:element) { :milestone }

        it "has custom options" do
          expect(options).to eq(type: :boolean)
        end
      end

      describe "percent_complete" do
        let(:element) { :percent_complete }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "percent_work_complete" do
        let(:element) { :percent_work_complete }

        it "has custom options" do
          expect(options).to eq(type: :integer)
        end
      end

      describe "cost" do
        let(:element) { :cost }

        it "has custom options" do
          expect(options).to eq(type: :decimal)
        end
      end

      describe "remaining_duration" do
        let(:element) { :remaining_duration }

        it "has custom options" do
          expect(options).to eq(type: :duration)
        end
      end

      describe "predecessor_links" do
        let(:element) { :predecessor_links }

        it "has custom options" do
          expect(options).to eq(
            type: MicrosoftProject::PredecessorLink,
            list: true,
            flatten: true
          )
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
