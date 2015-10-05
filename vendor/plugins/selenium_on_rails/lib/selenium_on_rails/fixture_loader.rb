require 'active_record/fixtures'

module SeleniumOnRails::FixtureLoader
  include SeleniumOnRails::Paths
  
  def available_fixtures
     files = Dir["test/fixtures/*.{yml,csv}"]
     files.collect {|f| f.sub(/\.[^.]*$/, '').sub('test/fixtures/', '')}
  end


  def load_fixtures fixtures
    table_names = []
    if fixtures == 'all'
      table_names = available_fixtures
    elsif fixtures.any?
      table_names = fixtures.split(/\s*,\s*/)
    end

    if table_names.any?
      Fixtures.create_fixtures fixtures_path, table_names
    end
    table_names
  end
  
end
