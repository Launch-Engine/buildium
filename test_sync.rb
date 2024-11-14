class TestSync
  def self.process(auth)
    obj = new(auth)
    obj.run
  end

  def initialize(auth)
    @buildium_auth = auth
    @rental_property_buildium_ids = []
    @lease_ids = []
    @error = nil
  end

  def run
    puts 'Checking Buildium connection...'
    check_buildium_connection
    return @error unless @error.nil?

    puts 'Syncing owners'
    sync_owners

    puts 'Syncing properties'
    sync_properties

    puts 'Syncing property units'
    sync_property_units

    puts 'Syncing leases'
    sync_leases

    puts 'Syncing lease notes and outstanding balances'
    sync_lease_notes

    puts 'Syncing outstanding balances'
    sync_outstanding_balances

    puts 'Done'

    true
  end

  private

  def check_buildium_connection
    return if Buildium::Connection.test(@buildium_auth)

    @error = 'Invalid Buildium credentials'
  end

  def result_data_empty?(results)
    raise results.error if results.instance_of?(Buildium::BuildiumError)

    results.data.empty?
  end

  def sync_leases
    offset = 0
    loop do
      results = Buildium::Lease.list(@buildium_auth.merge(limit: 100, offset: offset))
      break if result_data_empty?(results)
      @lease_ids += results.data.map { |lease| lease[:id] }
      break if results.data.size < 100
      offset += 100
    end
  end

  def sync_lease_notes
    note_failures = 0
    @lease_ids.each do |lease_id|
      offset = 0
      loop do
        results = Buildium::LeaseNote.list(
          buildium_auth.merge(
            limit: 100,
            offset: offset,
            lease_id: lease_id
          )
        )
        break if result_data_empty?(results)
        break if results.data.size < 100
        offset += 100
      end
    end
  end

  def sync_outstanding_balances
    @lease_ids.each_slice(100) do |lease_ids_batch|
      offset = 0
      loop do
        results = Buildium::LeaseBalance.list(
          @buildium_auth.merge(
            limit: 100,
            offset: offset,
            leaseids: lease_ids_batch.join(',')
          )
        )
        break if result_data_empty?(results)
        break if results.data.size < 100
        offset += 100
      end
    end
  end

  def sync_properties
    offset = 0
    loop do
      results = Buildium::RentalProperty.list(@buildium_auth.merge(limit: 100, offset: offset))
      break if result_data_empty?(results)
      @rental_property_buildium_ids += results.data.map { |property| property[:id] }
      break if results.data.size < 100
      offset += 100
    end
  end

  def sync_property_units
    return if @rental_property_buildium_ids.empty?

    # The URL has to be done this way or else it can get to long
    @rental_property_buildium_ids.each_slice(100).each do |buildium_id_group|
      offset = 0
      loop do
        results = Buildium::RentalPropertyUnit.list(
          @buildium_auth.merge(
            limit: 100,
            offset: offset,
            propertyids: buildium_id_group.join(',')
          )
        )
        break if result_data_empty?(results)
        break if results.data.size < 100
        offset += 100
      end
    end
  end

  def sync_owners
    offset = 0
    loop do
      results = Buildium::Owner.list(@buildium_auth.merge(limit: 100, offset: offset))
      break if result_data_empty?(results)
      break if results.data.size < 100
      offset += 100
    end
  end
end
