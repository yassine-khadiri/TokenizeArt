const connectWalletBtn = document.getElementById("connect-wallet");
const mintBtn = document.getElementById("mint-btn");
const statusEl = document.getElementById("status");
const walletInfoEl = document.getElementById("wallet-info");

// Contract configuration
const CONTRACT_ADDRESS = "0x123456789...";
const MINT_PRICE = "0.042";

// Simple ABI for minting function
const ABI = [
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "string",
        name: "uri",
        type: "string",
      },
    ],
    name: "mint",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
];

const connectWallet = async () => {
  // ensure that there is an injected the Ethereum provider
  if (window.ethereum) {
    // use the injected Ethereum provider to initialize Web3.js
    const web3 = new Web3(window.ethereum);

    // check if Ethereum provider comes from MetaMask
    // if (window.ethereum.isMetaMask) alert("MetaMask is installed!");
    // else alert("MetaMask is not installed!");

    // Update UI
    if (window.ethereum.isMetaMask) {
      walletInfoEl.textContent = `${address.substring(
        0,
        6
      )}...${address.substring(address.length - 4)}`;
      walletInfoEl.style.display = "block";
      connectWalletBtn.textContent = "Wallet Connected";
      web3.eth.getAccounts(console.log);
    }

    // get chain ID and populate placeholder
    // document.getElementById(
    //   "chainId"
    // ).innerText = `Chain ID: ${await web3.eth.getChainId()}`;
    // // get latest block and populate placeholder
    // document.getElementById(
    //   "latestBlock"
    // ).innerText = `Latest Block: ${await web3.eth.getBlockNumber()}`;

    // subscribe to new blocks and update UI when a new block is created
    // const blockSubscription = await web3.eth.subscribe("newBlockHeaders");
    // blockSubscription.on("data", (block) => {
    //   document.getElementById(
    //     "latestBlock"
    //   ).innerText = `Latest Block: ${block.number}`;
    // });
  } else {
    // no Ethereum provider - instruct user to install MetaMask
    document.getElementById("warn").innerHTML =
      "Please <a href='https://metamask.io/download/'>install MetaMask</a>.";
  }
};

// // Connect wallet function
// async function connectWallet() {
//   if (window.ethereum) {
//     try {
//       // Request account access
//       const accounts = await window.ethereum.request({
//         method: "eth_requestAccounts",
//       });
//       const address = accounts[0];

//       // Update UI
//       walletInfoEl.textContent = `${address.substring(
//         0,
//         6
//       )}...${address.substring(address.length - 4)}`;
//       walletInfoEl.style.display = "block";
//       connectWalletBtn.textContent = "Wallet Connected";
//       mintBtn.disabled = false;

//       return address;
//     } catch (error) {
//       showStatus("error", "Failed to connect wallet. Please try again.");
//       console.error(error);
//     }
//   } else {
//     showStatus(
//       "error",
//       "MetaMask is not installed. Please install it to mint NFTs."
//     );
//   }
// }

// Mint NFT function
async function mintNFT() {
  if (!window.ethereum) {
    showStatus("error", "MetaMask is not installed.");
    return;
  }

  try {
    // Set status to pending
    showStatus("pending", "Transaction pending...");

    // Get current account
    const accounts = await window.ethereum.request({
      method: "eth_accounts",
    });
    if (accounts.length === 0) {
      showStatus("error", "Please connect your wallet first.");
      return;
    }

    const address = accounts[0];

    // Create web3 instance
    // Note: In a real implementation, you'd use ethers.js or web3.js
    // This is a simplified example

    /*
                // Example with ethers.js (you'd need to include the library)
                const provider = new ethers.providers.Web3Provider(window.ethereum);
                const signer = provider.getSigner();
                const contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer);
                
                // Convert price to Wei
                const priceInWei = ethers.utils.parseEther(MINT_PRICE);
                
                // Call mint function
                const tx = await contract.mint(address, {
                    value: priceInWei
                });
                
                // Wait for transaction to be mined
                await tx.wait();
                */

    // Simulation of successful minting for demo purposes
    setTimeout(() => {
      showStatus(
        "success",
        "NFT minted successfully! Transaction hash: 0x123...456"
      );
      mintBtn.disabled = true;
      mintBtn.textContent = "Minted";
    }, 2000);
  } catch (error) {
    showStatus("error", "Error minting NFT: " + error.message);
    console.error(error);
  }
}

// Helper to show status messages
function showStatus(type, message) {
  statusEl.textContent = message;
  statusEl.className = "status " + type;
}

// Event listeners
connectWalletBtn.addEventListener("click", connectWallet);
mintBtn.addEventListener("click", mintNFT);
