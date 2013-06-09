# coding: utf-8
require 'spec_helper'

describe JpPrefecture::Prefecture do
  describe '.build' do
    let(:pref) { JpPrefecture::Prefecture.build(1, '北海道', 'Hokkaido') }
    it { pref.code.should eq 1 }
    it { pref.name.should eq '北海道' }
    it { pref.name_e.should eq 'Hokkaido' }
  end

  describe '.find' do
    shared_examples "都道府県が見つかった場合" do
      it { pref.code.should eq 1 }
      it { pref.name.should eq '北海道' }
      it { pref.name_e.should eq 'Hokkaido' }
    end

    shared_examples '都道府県が見つからなかった場合' do
      it { pref.should be_nil }
    end

    describe '都道府県コード' do
      context '都道府県が見つかった場合' do
        let(:pref) { JpPrefecture::Prefecture.find(1) }
        it_behaves_like "都道府県が見つかった場合"
      end

      context '都道府県が見つからなかった場合' do
        let(:pref) { JpPrefecture::Prefecture.find(99) }
        it_behaves_like "都道府県が見つからなかった場合"
      end
    end
  end

  describe '.all' do
    let(:prefs) { JpPrefecture::Prefecture.all }
    it { prefs.first.should be_an_instance_of(JpPrefecture::Prefecture) }
    it '都道府県の数が 47 であること' do
      prefs.count.should eq 47
    end
  end
end
