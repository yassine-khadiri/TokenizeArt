## Prerequisites

1. **Web browser** (Chrome/Firefox recommended)
2. **Wallet Setup**:
   Sepolia is pre-installed in MetaMask. Simply:

   1. Open your MetaMask extension

   2. Click the network dropdown (top center)

   3. Select "Sepolia Test Network"

3. Get free Sepolia ETH for gas fees:  
   [Sepolia Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)

### 1. Access Remix IDE

1. Open your web browser and navigate to [Remix Ethereum IDE](https://remix.ethereum.org/)
2. You'll see the default workspace with some example files

### 2. Create Contract File

1. In the File Explorer panel (left side), create a new file named (\_42CommunityNFT.sol) inside contracts folder

### 3. Add the Contract Code

1. Open your newly created `.sol` file
2. Copy and paste the NFT contract code from the prepared files [\_42CommunityNFT.sol](../code/contracts/_42CommunityNFT.sol)

### 4. Compile the Contract

1. Click on the "Solidity Compiler" tab in the left sidebar
2. Make sure the compiler version is set to 0.8.0 or higher
3. Click "Compile \_42CommunityNFT.sol"
4. Check for any compilation errors in the output panel

### 5. Connect Your Wallet

1. Click on the "Deploy & Run Transactions" tab
2. In the "Environment" dropdown, select "Injected Provider - MetaMask"
3. Select the account you want to use for deployment
4. Make sure you're connected to Sepolia Testnet in MetaMask

## Verification (After Deployment)

#### Method 1: Remix Etherscan Plugin (Recommended)

[![Step-by-Step Video Guide](https://img.youtube.com/vi/hEJ1OlT8jQ4/0.jpg)](https://www.youtube.com/watch?v=hEJ1OlT8jQ4)

_Benefits_:

- Handles constructor arguments automatically
- Directly connects to your deployed contract
- No manual file uploads required

#### Method 2: Manual Etherscan Verification

**Steps**:

1. Note your contract address after deployment
2. Go to [Sepolia Etherscan](https://sepolia.etherscan.io/)
3. Search for your contract address
4. Click the "Contract" tab → "Verify and Publish"
5. Select:
   - Compiler type: Solidity (Single/Multi-File)
   - Compiler version (must match!)
6. Upload source files
