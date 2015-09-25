require 'spec_helper'

describe Guard::HoneycombSolr do
  subject { described_class.new(watchers, options) }
  let(:watchers) { [] }
  let(:options) { {} }

  describe '#start_honeycomb_solr' do
    it 'starts HoneycombSolr' do
      expect(subject.server).to receive(:start)
      subject.start_honeycomb_solr
    end
  end

  describe '#stop_honeycomb_solr' do
    it 'stops HoneycombSolr' do
      expect(subject.server).to receive(:stop)
      subject.stop_honeycomb_solr
    end
  end

  describe '#restart_honeycomb_solr' do
    it 'restarts HoneycombSolr' do
      expect(subject.server).to receive(:restart)
      subject.restart_honeycomb_solr
    end
  end

  describe '#start' do
    it "calls #start_honeycomb_solr" do
      expect(subject).to receive(:start_honeycomb_solr)
      subject.start
    end
  end

  describe '#stop' do
    it 'calls #stop_honeycomb_solr' do
      expect(subject).to receive(:stop_honeycomb_solr)
      subject.stop
    end
  end

  describe '#reload' do
    it 'calls #restart_honeycomb_solr' do
      expect(subject).to receive(:restart_honeycomb_solr)
      subject.reload
    end
  end

  describe '#run_on_changes' do
    it 'calls #restart_honeycomb_solr' do
      expect(subject).to receive(:restart_honeycomb_solr)
      subject.run_on_changes([])
    end
  end
end
