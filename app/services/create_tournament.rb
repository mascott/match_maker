# Implements a round robin tournament algorithm.
#
# Explaination of the algorithm can be found on wikipedia:
# http://en.wikipedia.org/wiki/Round-robin_tournament
#

class CreateTournament
  include Service

  def initialize(participants)
    @participants = participants
    @participant_count = participants.count
    @indicies = @participants.count.times.map{|i| i }
    @pivot = @indicies.shift
  end

  def call
    tournament = {}
    rounds.times do |round|
      tournament[round] = matches_for_round(round)
      @indicies.rotate!(-1)
    end
    tournament
  end

  private

  def rounds
    @participant_count - 1
  end

  def matches_for_round(round)
    @indicies.unshift(@pivot)
    matches = (@participant_count/2).times.map{|i| [@indicies[i], @indicies[@indicies.count - i - 1]]}
    @indicies.shift
    matches
  end
end