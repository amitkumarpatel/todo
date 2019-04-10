require 'rails_helper'

# Test suite for the Item model
RSpec.describe Element, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:page) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_uniqueness_of(:content).scoped_to(:page_id) }

end