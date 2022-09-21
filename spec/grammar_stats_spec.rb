require_relative "../lib/grammar_stats.rb"

RSpec.describe "GrammarStats" do

  describe "check method" do
    it "returns text" do
      text = GrammarStats.new
      expect(text.check("Hello there.")).to eq true
    end

    it "returns empty for no text given" do
      text = GrammarStats.new
      expect(text.check("")).to eq false
    end

    it "returns true for a capital letter at the start of the sentence" do
      text = GrammarStats.new
      expect(text.check("Hello")).to eq false
    end

    it "returns true for a punctuation mark at the end of the sentence" do
      text = GrammarStats.new
      expect(text.check("hello.")).to eq false
    end
  end

  describe "percentage_good method" do
    context "when given 1 true & 1 false" do
      it "returns the percentage of true's out of total checks" do
        result = GrammarStats.new
        check1 = result.check("hello.")
        check2 = result.check("Hello.")
        expect(result.percentage_good).to eq 50
      end
    end

    context "when given only 1 true text" do
      it "returns 100" do
        result = GrammarStats.new
        check1 = result.check("Hello.")
        expect(result.percentage_good).to eq 100
      end
    end
  end
end