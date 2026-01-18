import { ethers } from "ethers";

const provider = new ethers.BrowserProvider(window.ethereum);

async function connectWallet() {
    await provider.send("eth_requestAccounts", []);
    const signer = await provider.getSigner();
    console.log("Connected account:", await signer.getAddress());
}

document.body.innerHTML = `<button id="connect">Connect Wallet</button>`;
document.getElementById("connect").onclick = connectWallet;
