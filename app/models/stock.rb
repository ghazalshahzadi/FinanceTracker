class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sanbox_api_key ],
                                      secret_token: 'Tsk_87db79820ca0411b9c5a46595a02df11',
                                       endpoint: 'https://sandbox.iexapis.com/v1')
        begin                                   
           new(ticker: ticker_symbol , name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
        rescue => exception
         return nil
        end 
    end
end
