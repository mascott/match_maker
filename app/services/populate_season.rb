class PopulateSeason
  include Service

  def initialize(season)
    @season = season
  end

  def call
    users ||= User.all.order(:first_name)
    periods = create_periods(period_count(users))
    tournament = CreateTournament.call(users)
    tournament.each_pair{|k, v| create_pairs(periods[k], users, v)}
    @season.save
    return @season
  end

  private

  def period_count(users)
    # TODO: This needs to be by group (male/female) and/or by tag
    users.count - 1
  end

  def create_pairs(period, users, pairs)
    pairs.each do |pair|
      period.pairings.new(hosting_user: users[pair.first],
                          visiting_user: users[pair.last])
    end
  end

  def create_periods(period_count)
    periods = []
    period_count.times do |count|
      periods << @season.periods.new(duration: @season.period_duration,
                                    start_date: next_date(@season.start_date, count, @season.period_duration))
    end
    periods
  end

  def next_date(start_date, count, period_duration)
    start_date.to_date + (7 * count * period_duration)
  end

end

