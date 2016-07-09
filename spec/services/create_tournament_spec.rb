require 'spec_helper'

RSpec.describe CreateTournament do 
  let(:participants) { 5.times.map { build(:user) } }
  subject { CreateTournament.call(participants) }

  context "should return created tournament" do
    specify { puts subject }
  end
end
