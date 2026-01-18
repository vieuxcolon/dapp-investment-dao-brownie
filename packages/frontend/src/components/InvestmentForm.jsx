import React, { useState } from 'react';

export default function InvestmentForm() {
  const [amount, setAmount] = useState('');

  const invest = () => {
    alert(`Investing ${amount} ETH (mockup)`);
  }

  return (
    <div>
      <h2>Invest</h2>
      <input
        type="number"
        placeholder="Amount in ETH"
        value={amount}
        onChange={e => setAmount(e.target.value)}
      />
      <button onClick={invest}>Invest</button>
    </div>
  )
}
