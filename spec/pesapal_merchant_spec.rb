require 'spec_helper'

describe Pesapal::Merchant do
  context 'when mode not specified' do
    before :each do
      @pesapal = Pesapal::Merchant.new
    end

    describe '#new' do
      it 'is valid object' do
        expect(@pesapal).to be_an_instance_of(Pesapal::Merchant)
      end

      it 'sets default environment variable' do
        expect(@pesapal.send(:env)).to eq 'development'
      end

      it 'sets default credentials' do
        expect(@pesapal.config).to eq(default_credentials)
      end

      it 'sets default order details' do
        expect(@pesapal.order_details).to eq({})
      end
    end

    describe '#set_env' do

      it 'sets default environment variable' do
        @pesapal.set_env
        expect(@pesapal.send(:env)).to eq 'development'
      end

      it 'sets endpoints for default environment' do
        expect(@pesapal.set_env).to eq(default_endpoints)
      end
    end
  end

  context 'when mode is specified as development' do
    before :each do
      @pesapal = Pesapal::Merchant.new(:development)
    end

    describe '#new(:development)' do
      it 'is valid object' do
        expect(@pesapal).to be_an_instance_of(Pesapal::Merchant)
      end

      it 'sets environment variable' do
        expect(@pesapal.send(:env)).to eq 'development'
      end

      it 'sets credentials' do
        expect(@pesapal.config).to eq(default_credentials)
      end

      it 'sets order details' do
        expect(@pesapal.order_details).to eq({})
      end
    end

    describe '#set_env(:development)' do
      it 'sets environment variable' do
        @pesapal.set_env :development
        expect(@pesapal.send(:env)).to eq 'development'
      end

      it 'sets endpoints for environment' do
        expect(@pesapal.set_env :development).to eq(default_endpoints)
      end
    end
  end

  context 'when mode is specified as production' do
    before :each do
      @pesapal = Pesapal::Merchant.new(:production)
    end

    describe '#new(:production)' do
      it 'is valid object' do
        expect(@pesapal).to be_an_instance_of(Pesapal::Merchant)
      end

      it 'sets environment variable' do
        expect(@pesapal.send(:env)).to eq 'production'
      end

      it 'sets credentials' do
        expect(@pesapal.config).to eq(default_credentials)
      end

      it 'sets order details' do
        expect(@pesapal.order_details).to eq({})
      end
    end

    describe '#set_env(:production)' do
      it 'sets environment variable' do
        @pesapal.set_env :production
        expect(@pesapal.send(:env)).to eq 'production'
      end

      it 'sets endpoints for environment' do
        expect(@pesapal.set_env :production).to eq(default_endpoints)
      end
    end

    private

    def default_credentials
      {
        :callback_url    => 'http://0.0.0.0:3000/pesapal/callback',
        :consumer_key    => '<YOUR_CONSUMER_KEY>',
        :consumer_secret => '<YOUR_CONSUMER_SECRET>'
      }
    end

    def default_endpoints
      {
        :postpesapaldirectorderv4 => 'http://demo.pesapal.com/API/PostPesapalDirectOrderV4',
        :querypaymentstatus       => 'http://demo.pesapal.com/API/QueryPaymentStatus',
        :querypaymentdetails      => 'http://demo.pesapal.com/API/QueryPaymentDetails'
      }
    end
  end
end
