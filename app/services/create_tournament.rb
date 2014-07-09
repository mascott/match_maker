# Implements a round robin tournament algorithm.
#
# Explaination of the algorithm can be found on wikipedia:
# http://en.wikipedia.org/wiki/Round-robin_tournament
#

class CreateTournament
  include Service

  def initialize(participants)
    @participants = participants.to_a
    @rounds = rounds
    @match_count = match_count
    @pivot = @participants.shift
  end

  def call
    rounds.times.each_with_object({}) do |round, tournament|
      tournament[round] = matches_for_round(round, @participants.rotate(-1 * round))
    end
  end

  private

  def rounds
    @rounds ||= @participants.count - 1
  end

  def match_count
    @match_count ||= @participants.count / 2
  end

  def matches_for_round(round, participants)
    participants.unshift(@pivot)
    match_count.times.map{|i| [participants[i], participants[participants.count - i - 1]]}
  end
end