shared_examples "commentable" do
  it { should have_many(:comments) } 
end