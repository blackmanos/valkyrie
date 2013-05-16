require 'spec_helper'

describe DatabaseConnection do
  subject { database_connection }
  let(:database_connection){ DatabaseConnection.new(attributes) }
  let(:attributes) { nil }

  context  'it should be eq passwords' do
    let(:attributes) { { password: 'testing' } }
    it { database_connection.password.should eq(attributes[:password]) }
  end

  context 'it should be valid with real attributes' do
    let(:attributes) { FactoryGirl.attributes_for(:database_connection) }
    it { should be_valid }
  end

  describe 'realm connections' do
    it 'it should create at last one character database connection' do
      database_connection = FactoryGirl.create(:database_connection)
      DatabaseConnection.character.count.should be  > 0
    end
  end
end
