from brownie import InvestmentFund, accounts

def test_investment():
    dev = accounts[0]
    fund = InvestmentFund.deploy({"from": dev})

    initial_balance = dev.balance()
    fund.invest({"from": dev, "value": "1 ether"})
    assert fund.balanceOf(dev) == 1e18

    fund.withdraw(1e18, {"from": dev})
    assert dev.balance() == initial_balance
