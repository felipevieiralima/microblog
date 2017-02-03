require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject { FactoryGirl.build(:tweet)}

  it { should belong_to(:usuario) }

  it "deve possuir uma factory válida" do
    expect(subject).to be_valid
  end

  it "não deve ser válido sem um content" do
    subject.content =  nil
    expect(subject).to_not be_valid
  end


end
