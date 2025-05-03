# Off-Chain NFT Usage Guide

## 🌟 Complete Workflow: From Minting to Viewing

### 1. Create NFT Image

- Format: PNG or JPG
- Example: Save as `42community_nft.png`

### 2. Upload to Pinata

A. **Create Pinata Account**
Go to Pinata [Pinata](https://pinata.cloud/)

B. **Upload Files**

Single File:

- Go to your [Pinata Dashboard](https://app.pinata.cloud/ipfs/files)

- Click → "Add" → "File Upload"

- Select your 42community_nft.png

- Wait for upload, then copy the CID

B. **Verification**

Test link: https://ipfs.io/ipfs/[your CID]

Should display your file

### 3. Create your .json metadata file

1. **Prepare metadata.json**:

```json
{
  "name": "YOUR_NFT_NAME",
  "description": "YOUR_NFT_DESCRIPTION",
  "image": "ipfs://[CID]", // Replace with your image CID
  "attributes": [{ "trait_type": "Artist", "value": "YOUR_INTRA_LOGIN" }]
}
```

2. **Upload your .json metadata also on Pinata and get the CID**:

### 4- Mint your off-chain NFT

Prepare Mint Parameters

Under "Deployed Contracts" section:

Find and expand mintOffChainNFT function

Enter:

- tokenId: Unique number
- \_tokenURI: Full IPFS URI (.json metadata) (Format: ipfs://[CID])

### 5: Verification & Viewing Your NFT

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
  Attributes match your JSON file
  Description appears

🔍 **Advanced Verification**

- Direct IPFS Check: https://ipfs.io/ipfs/[YOUR_METADATA_CID]

- Contract Query (Remix): tokenURI(1) // Returns your IPFS URI
