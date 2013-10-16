require 'spec_helper'

describe Guard::Jetty do
  subject { described_class.new(watchers, options) }
  let(:watchers) { [] }
  let(:options) { {} }
  let(:default_options) { YAML.load_file('config/jetty.yml')['default'] }

  describe '#jetty_config' do
    describe 'by default' do
      it 'loads from config/jetty.yml' do
        expect(subject.jetty_config).to be == default_options
      end
    end

    describe 'modified options' do
      let(:options) { {'jetty_port' => default_options['jetty_port'] + 1 } }

      it 'alters jetty config options' do
        expect(subject.jetty_config['jetty_port']).to be == default_options['jetty_port'] + 1
      end

      it 'does not alter other options' do
        expect(subject.jetty_config['java_opts']).to be == default_options['java_opts']
      end
    end
  end

  describe '#start_jetty' do
    it 'starts Jetty' do
      expect(Jettywrapper).to receive(:start).with(subject.jetty_config)
      subject.start_jetty
    end
  end

  describe '#stop_jetty' do
    it 'stops Jetty' do
      expect(Jettywrapper).to receive(:stop).with(subject.jetty_config)
      subject.stop_jetty
    end
  end

  describe '#restart_jetty' do
    it 'stops and starts jetty' do
      expect(subject).to receive(:stop_jetty)
      expect(subject).to receive(:start_jetty)
      subject.restart_jetty
    end
  end

  describe '#start' do
    it "calls #start_jetty" do
      expect(subject).to receive(:start_jetty)
      subject.start
    end
  end

  describe '#stop' do
    it 'calls #stop_jetty' do
      expect(subject).to receive(:stop_jetty)
      subject.stop
    end
  end

  describe '#reload' do
    it 'calls #restart_jetty' do
      expect(subject).to receive(:restart_jetty)
      subject.reload
    end
  end

  describe '#run_on_changes' do
    it 'calls #restart_jetty' do
      expect(subject).to receive(:restart_jetty)
      subject.run_on_changes([])
    end
  end
end
