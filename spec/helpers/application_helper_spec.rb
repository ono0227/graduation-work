require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#full_title(page_title)" do
    subject { full_title(page_title) }

    context "page_titleが空白の場合" do
      let(:page_title) { "" }

      it { is_expected.to eq("BIGBAG Store") }
    end

    context "page_titleがnilの場合" do
      let(:page_title) { nil }

      it { is_expected.to eq("BIGBAG Store") }
    end

    context "page_titleが存在する場合" do
      let(:page_title) { "test" }

      it { is_expected.to eq("test - BIGBAG Store") }
    end
  end
end
