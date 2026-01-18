import React from 'react';
import InvestmentForm from './components/InvestmentForm';
import VotingPanel from './components/VotingPanel';

export default function App() {
  return (
    <div>
      <h1>DAO Investment DApp</h1>
      <InvestmentForm />
      <VotingPanel />
    </div>
  );
}
