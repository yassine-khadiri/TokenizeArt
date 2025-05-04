# On-Chain NFT Usage Guide

## 🌟 Complete Workflow: From Minting to Viewing

### 🌐 Website Interaction Guide

🚨 BEFORE LAUNCHING THE WEBSITE

**\*Essential Configuration Step**

Copy Your Deployed Contract Address:

From Remix: Check "Deployed Contracts" section

**Paste in index.html:**

```javascript
const CONTRACT_ADDRESS = ""; // ← Paste your address here
```

### 1. Launch the Website

**Option A (VS Code):**

Open project in VS Code

Right-click index.html → "Open with Live Server"

Browser will open automatically at localhost:5500

Option B (Direct Open):

Simply drag-and-drop index.html into your preferred browser

### 2. Connect Your Wallet

Click "Connect Wallet" button

MetaMask will pop up:

Choose your account

Click "Connect"

### 3. Mint On-Chain NFT

- Scroll to minting form

- Fill all required fields

- Mint Button will enable only when:

All fields are filled and Wallet is connected

_- Click "Mint Now"_

MetaMask pops up with transaction details
Confirm gas fee
Wait for confirmation (typically 15-30 secs)

### 4: Verification & Viewing Your NFT

✅ **Transaction Verification**

- MetaMask Confirmation
  Check the transaction in MetaMask activity tab

- Etherscan Check
  Transaction should appear on [Sepolia Etherscan](https://sepolia.etherscan.io/)

🖼️ **View Your NFT in MetaMask**

- Import NFT:
  Go to MetaMask "NFTs" tab → Click "Import NFTs" → Enter:

  ```
    Contract Address: [Your contract address]
    Token ID: [Your minted ID, e.g. 1]
    Click "Import"
  ```

- NFT Should Appear:

  Displays with your image/name
  token Id
  Shows token standard: "ERC721"

🌐 **View on OpenSea**

- From MetaMask:
  Click your NFT → Click "⋮" → "View on OpenSea"

- Verify Metadata:
  Image loads correctly
  Attributes match your form values
  Description appears
