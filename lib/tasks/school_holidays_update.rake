desc 'Uses OpenDataSoft API to update french holidays dates and save it to local file to be used by calendar.js'

task :school_holidays_update => :environment do

  @day_of_month = Time.now.utc.mday

  def open(url)
    Net::HTTP.get(URI.parse(url))
  end

  if (@day_of_month == 13)
    page_content = open('https://public.opendatasoft.com/api/records/1.0/search/?dataset=calendrier-scolaire-zones-a-b-et-c&rows=1000&facet=DESCRIPTION&facet=zone&refine.zone=C&exclude.DESCRIPTION=Pr%C3%A9rentr%C3%A9e+des+enseignants')

    holidays_file = Dir.glob("#{Rails.root}/app/assets/javascripts/school-holidays.js")[0]

    File.open(holidays_file, 'w') {|f| f.write(
        "var OfficialHolidays = " + page_content
    ) }

    Rake::Task['assets:precompile'].invoke
  end

end