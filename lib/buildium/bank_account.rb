module Buildium
  class BankAccount < Buildium::Base
    def self.path
      'bankaccounts'
    end

    def self.checks(bank_account_id, params = {})
      response = process_request(:get, "#{path}/#{bank_account_id}/checks", params)
      return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

      Buildium::BuildiumError.new(response)
    end

    def self.deposits(bank_account_id, params = {})
      response = process_request(:get, "#{path}/#{bank_account_id}/deposits", params)
      return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

      Buildium::BuildiumError.new(response)
    end

    def self.withdrawals(bank_account_id, params = {})
      response = process_request(:get, "#{path}/#{bank_account_id}/withdrawals", params)
      return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

      Buildium::BuildiumError.new(response)
    end

    def self.transfers(bank_account_id, params = {})
      response = process_request(:get, "#{path}/#{bank_account_id}/transfers", params)
      return Buildium::BuildiumResultSet.new(response) if SUCCESS_CODES.include?(response.response_code)

      Buildium::BuildiumError.new(response)
    end
  end
end
