class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sanbox_api_key ],
                                      secret_token: 'Tsk_87db79820ca0411b9c5a46595a02df11',
                                       endpoint: 'https://sandbox.iexapis.com/v1')
        client.price(ticker_symbol)
    end
end
