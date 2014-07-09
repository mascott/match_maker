class PopulateSeason
  include Service

  def initialize(season)
    @season = season
    # TODO: This needs to respect the appropriate tags
    # or the appropriate set of users should be passed into the service.
    @users ||= User.all.order(:first_name)
  end

  def call
    populate_season_from_tournament(CreateTournament.call(@users))
    @season.save
    return @season
  end

  private

  def populate_season_from_tournament(tournament)
    tournament.each_pair do |round, matches|
      period = create_period(round)
      create_pairs(period, matches)
    end
  end

  def create_period(round)
    @season.periods.new(duration: @season.period_duration,
                        start_date: round_date(round))
  end

  def create_pairs(period, matches)
    matches.each do |match|
      period.pairings.new(hosting_user: match.first,
                          visiting_user: match.last)
    end
  end

  def round_date(round)
    @season.start_date.to_date + round_offset(round)
  end

  # Returns the number of days to offset the date given the current round.
  # Period duration is given in number of weeks.
  def round_offset(round)
    7 * @season.period_duration * round
  end

end

