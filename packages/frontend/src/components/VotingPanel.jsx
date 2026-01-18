import React from 'react';

export default function VotingPanel() {
  const vote = () => {
    alert("Voting (mockup)");
  }

  return (
    <div>
      <h2>Vote</h2>
      <button onClick={vote}>Vote</button>
    </div>
  )
}
