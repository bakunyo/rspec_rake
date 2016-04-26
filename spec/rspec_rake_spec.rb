require 'spec_helper'

describe RSpecRake do
  it 'has a version number' do
    expect(RSpecRake::VERSION).not_to be nil
  end

  describe 'auto_reenable' do
    context 'no set' do
      it { expect(Sample).to receive(:method_a).once }
      after { 2.times { Rake::Task['sample:method_a'].invoke } }
    end

    context 'set auto_reenable' do
      before { RSpecRake.auto_reenable = true }
      it { expect(Sample).to receive(:method_b).twice }
      after { 2.times { Rake::Task['sample:method_b'].invoke } }
    end
  end
end
