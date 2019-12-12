require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should have_db_column(:commentable_id).of_type(:integer) }
  it { should have_db_column(:commentable_type).of_type(:string) }
  it { should belong_to(:commentable) }


end
