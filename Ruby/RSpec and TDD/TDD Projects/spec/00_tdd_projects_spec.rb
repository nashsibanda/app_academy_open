require 'rspec'
require '00_tdd_projects'

describe Array do
  
  describe "#my_uniq" do
    subject(:my_uniq_subject) { [1, 2, 1, 3, 3, 5, 4, 4] }
    it "should return an array with no duplicates" do
      expect(my_uniq_subject.my_uniq).to eq([1, 2, 3, 5, 4])
    end
  end

  describe "#two_sum" do
    subject(:two_sum_subject) { [-1, 0, 2, -2, 1, -2, 1, -1] }
    let(:correct) { [[0, 4], [0, 6], [2, 3], [2, 5], [4, 7], [6, 7]] }
    
    it "should return pairs of indexes that sum to zero" do
      expect(two_sum_subject.two_sum).to match_array(correct)
    end
    
    it "should sort pairs dictionary-wise" do
      expect(two_sum_subject.two_sum).to eq(correct)
    end
  end

  describe "#my_transpose" do
    subject(:transpose_subject) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ] }
    let(:transposed) { [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ] }

    it "should return a transposed 2-D array" do
      expect(transpose_subject.my_transpose).to eq(transposed)
    end
  end

  describe "#stock_picker" do
    subject(:stocks) { [159, 299, 3, 14, 46, 33, 172] }
    let(:best_days) { [2, 6] }

    it "should choose the best buy and sell days" do
      expect(stocks.stock_picker).to eq(best_days)
    end

  end


end