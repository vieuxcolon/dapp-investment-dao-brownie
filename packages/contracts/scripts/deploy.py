from brownie import InvestmentFund, Voting, accounts

def main():
    dev = accounts[0]

    # Deploy InvestmentFund
    fund = InvestmentFund.deploy({"from": dev})
    print(f"InvestmentFund deployed at: {fund.address}")

    # Deploy Voting
    voting = Voting.deploy({"from": dev})
    print(f"Voting deployed at: {voting.address}")
