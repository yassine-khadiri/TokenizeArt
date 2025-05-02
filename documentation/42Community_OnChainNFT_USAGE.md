# Off-Chain NFT Usage Guide

## 🌟 Complete Workflow: From Minting to Viewing

### 1️- Upload Metadata to Pinata

1. **Prepare metadata.json**:

````json
{
  "name": "YOUR NFT NAME",
  "description": "YOUR NFT DESCRIPTION",
  "image": "ipfs://...",
  "attributes": [
    {"trait_type": "Artist", "value": "YOUR INTRA LOGIN"},
  ]
}

### 2- Upload to Pinata
Upload to Pinata:

Go to pinata.cloud

Click "Upload" → "File"

Select your metadata.json

Copy the returned CID (e.g. QmXyZ...)

Get full IPFS URI:

ipfs://QmXyZ.../metadata.json

Mint NFT in Remix
Connect MetaMask (Sepolia network)

In Remix console:

javascript
await contract.mintOffChainNFT(
  1, // Token ID
  "ipfs://QmXyZ.../metadata.json" // Your metadata URI
);
3️⃣ View NFT in MetaMask
Import NFT:

Open MetaMask → "NFTs" tab

Click "Import NFTs"

Enter:

Contract Address: 0x... (from deployment)

Token ID: 1

Token Standard: ERC721

View Details:

Click on your NFT

"View on OpenSea" → Opens testnets.opensea.io

"View IPFS" → Shows raw metadata

4️⃣ Verify Metadata
On OpenSea Testnet:

https://testnets.opensea.io/assets/sepolia/CONTRACT_ADDRESS/1
Should display your image and attributes

Direct IPFS Access:

Use public gateway:

https://ipfs.io/ipfs/QmXyZ.../metadata.json


Troubleshooting
Issue	Solution
"Invalid token URI"	Double-check IPFS URI format
NFT not appearing	Wait 5 mins then refresh MetaMask
Broken image	Verify image link in metadata
OpenSea 404	Wait 30 mins for propagation




# Off-Chain NFT Usage Guide

## 🖼️ Step 1: Prepare & Upload NFT Assets

### 1. Create NFT Image
- Format: PNG or JPG (Recommended: 1000x1000px)
- Example: Save as `42community_nft.png`

### 2. Upload Image to Pinata
1. Go to [Pinata.cloud](https://pinata.cloud)
2. Click "Upload" → "File"
3. Select your `42community_nft.png`
4. Copy the returned CID (e.g. `QmXyZ123...`)

📌 **Image IPFS URI**:
`ipfs://QmXyZ123.../42community_nft.png`

## 📝 Step 2: Create Metadata File

1. Prepare `metadata.json`:
```json
{
  "name": "42 Community Pass",
  "description": "Official member of 42 programming community",
  "image": "ipfs://QmXyZ123.../42community_nft.png",
  "attributes": [
    {"trait_type": "Campus", "value": "Paris"},
    {"trait_type": "Level", "value": "42"},
    {"trait_type": "Generation", "value": "2025"}
  ]
}
````
