require 'spec_helper'

describe Capybara::DangerZone::Wait do
  let(:some_start_time) { Time.new(2014, 11, 15, 13, 37, 0) }

  describe '#exceeded_threshold?' do
    before do
      allow(Capybara::DangerZone).to receive(:rate_threshold).and_return(0.80)
    end

    it 'is true when the wait amount is greater than the threshold' do
      end_time        = some_start_time + 9
      maximum_seconds = 10

      wait = described_class.new(some_start_time, end_time, maximum_seconds)

      expect(wait.exceeded_threshold?).to be true
    end

    it 'is false when the wait amount is less than the threshold' do
      end_time        = some_start_time + 5
      maximum_seconds = 10

      wait = described_class.new(some_start_time, end_time, maximum_seconds)

      expect(wait.exceeded_threshold?).to be false
    end

    it 'is false when the wait amount is exactly the threshold' do
      end_time        = some_start_time + 8
      maximum_seconds = 10

      wait = described_class.new(some_start_time, end_time, maximum_seconds)

      expect(wait.exceeded_threshold?).to be false
    end
  end

  describe '#seconds_waited' do
    it 'is the difference in seconds between the start and end time' do
      end_time = some_start_time + 42

      wait = described_class.new(some_start_time, end_time, 1)

      expect(wait.seconds_waited).to eql(42.0)
    end
  end
end
