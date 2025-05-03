# TokenizeArt Project

## Overview

An advanced ERC721 NFT contract with both off-chain and fully on-chain NFT capabilities. The contract allows for:

1. Traditional off-chain metadata NFTs (IPFS-based)
2. Fully on-chain NFTs with SVG images and metadata stored directly in the contract

## Language Choice

**Solidity** Selected for its:

Native Ethereum Virtual Machine (EVM) compatibility

Mature tooling (Remix, Hardhat, Foundry)

Secure arithmetic operations (built-in overflow checks)

Industry-wide adoption for smart contracts

## Project Structure

```
  TokenizeArt/
  ├── code/
  │   ├── _42CommunityWebsite/            # A simple Frontend interface (HTML/CSS/JS)
  │   └── contracts/
  │       └── _42CommunityNFT.sol         # Main ERC721 NFT contract (both on-chain/off-chain)
  ├── deployment/
  │   ├── README.md                       # Deployment guide
  ├── documentation/
  │   ├── 42Community_OffChain_USAGE.md   # IPFS-based NFT usage guide
  │   └── 42Community_OnChain_USAGE.md    # On-chain SVG NFT usage guide
  ├── mint/                               # Pre-configured NFT packages (assets + metadata folders)
  └── README.md                           # Project overview and quickstart
```

## Development Environment

This project was developed using [Remix Ethereum IDE](https://remix.ethereum.org/), which offers:

- Web-based accessibility
- Integrated compilation and deployment
- Easy interaction with deployed contracts
- Support for importing OpenZeppelin contracts

### Smart Contract (`_42Community.sol`)

**Features**:

1. **Dual Minting System**:

   - `mintOffChainNFT`: Traditional NFTs with external metadata (IPFS)
   - `mintOnChainNFT`: Fully on-chain NFTs with SVG generation

2. **On-Chain Components**:

   - SVG image generation
   - Base64 encoded metadata
   - Structured attribute system

3. **Technical Specifications**:
   - ERC721 standard with URIStorage extension
   - Ownable pattern for access control
   - Optimized for gas efficiency

## Technical Design Choices

### 1. Dual Minting System

- **Off-Chain Minting**:
  - Simple interface for traditional NFT workflows
  - Maximum flexibility for external metadata
- **On-Chain Minting**:
  - Fully self-contained NFT generation
  - No external dependencies
  - Permanent storage on blockchain

### 2. On-Chain Implementation

- **SVG Generation**:
  - Minimalist SVG design for gas efficiency
  - Dynamic text content
  - ViewBox optimized for simple display
- **Base64 Encoding**:
  - Uses OpenZeppelin's Base64 library
  - Efficient encoding of both SVG and JSON
  - Data URI scheme for direct browser rendering

### 3. Data Structures

- **Struct Organization**:
  - `NFTMetaData` for core NFT properties
  - `Attributes` for trait management
  - Clear separation of concerns

### 4. Security

- **Ownable Pattern**:
  - Restricted minting to contract owner
  - Prevents unauthorized NFT creation
- **Safe Minting**:
  - Uses `_safeMint` for contract address protection

## Website Integration

### Frontend Implementation

**Key Components**:

1. **Wallet Integration**:

   - MetaMask connection
   - Address display
   - Web3.js implementation

2. **Minting Interface**:

   - Token ID input
   - Metadata URI field
   - Transaction status monitoring

3. **User Experience**:
   - Responsive design
   - Clear instructions

### Quick Start Guide

#### Step 1: Deploy Your Smart Contract

1. Open [Remix Ethereum IDE](https://remix.ethereum.org/)
2. Create a new Solidity file
3. Copy the contract code from:
   - `code/contracts/_42CommunityNFT.sol`
4. Compile the contract in Remix
5. Deploy using MetaMask or your preferred Ethereum wallet

For detailed deployment instructions, refer to:

- [\_42CommunityNFT_DEPLOYMENT.md](./deployment/README.md)

#### Step 2: Refer to Documentation

refer to:

- [\42Community_OffChainNFT_USAGE.md](./documentation/42Community_OffChainNFT_USAGE.md)
- [\42Community_OnChainNFT_USAGE.md](./documentation/42Community_OnChainNFT_USAGE.md)
