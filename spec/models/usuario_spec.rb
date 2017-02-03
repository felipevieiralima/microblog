require 'rails_helper'

RSpec.describe Usuario, type: :model do

  subject { FactoryGirl.build(:usuario) }

  it { should validate_presence_of(:nome) }

  it "deve possuir uma factory válida" do
    expect(subject).to be_valid
  end

  it "não deve ser válido sem um nome" do
    subject.nome =  nil
    expect(subject).to_not be_valid
  end

  it "não deve ser válido sem um email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "não deve ser válido sem uma senha" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  describe "after creation" do
    it "deve mandar um email de confirmação" do
      expect { subject.save }.to change( Devise.mailer.deliveries, :count ).by(1)
    end
  end


end
