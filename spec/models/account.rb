require 'rails_helper'

RSpec.describe(Account, :type => :model) do
  it 'can deposit' do
    account = Account.new('Indra', 1_000_000)
    account.deposit(500_000)
    expect(account.amount).to(eq(1_500_000))
  end
  it 'can withdraw' do
    account = Account.new('Indra', 1_000_000)
    account.withdraw(500_000)
    expect(account.amount).to(eq(500_000))
  end
  it 'can transfer' do
    account_indra = Account.new('Indra', 1_000_000)
    account_firmansyah = Account.new('Firmansyah', 5_000_000)
    account_indra.transfer(account_firmansyah, 500_000)
    expect(account_indra.amount).to(eq(500_000))
    expect(account_firmansyah.amount).to(eq(5_500_000))
  end
  it 'raise NotEnoughAmount' do
    account_indra = Account.new('Indra', 1_000_000)
    expect do
      account_indra.withdraw(5_000_000)
    end.to(raise_error(NotEnoughAmount))
    expect(account_indra.amount).to(eq(1_000_000))
  end
  it 'cannot transfer because of not enough amount' do
    account_indra = Account.new('Indra', 1_000_000)
    account_firmansyah = Account.new('Firmansyah', 5_000_000)
    expect do
      account_indra.transfer(account_firmansyah, 5_000_000)
    end.to(raise_error(NotEnoughAmount))
    expect(account_indra.amount).to(eq(1_000_000))
    expect(account_firmansyah.amount).to(eq(5_000_000))
  end
end