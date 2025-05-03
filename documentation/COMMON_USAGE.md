### NFT Contract Function Reference

## 🔍 Core ERC721 Functions

### supportsInterface(bytes4 interfaceId) → bool

**Purpose**: Checks if contract implements a specific interface
**Standard**: ERC-165 compliant

Key Interfaces:

0x80ac58cd → ERC721 (always true)

0x5b5e139f → ERC721Metadata (always true)

0x01ffc9a7 → ERC165 (always true)

_Behavior_:

Returns true for:
✓ ERC721
✓ ERC721Metadata
✓ ERC165

Returns false for unregistered interfaces

# name()

**Returns**: "\_42Community"

# symbol()

**Returns**: "\_42CY"

# `ownerOf(uint256 tokenId) → address`

**Returns**: Current owner of specified NFT

**Reverts if**: Token doesn't exist

# balanceOf(address owner) → uint256

**Returns**: Number of NFTs owned by address

# tokenURI(uint256 tokenId) → string

**Returns**: Metadata URI (IPFS/data URI)

_Behavior:_

- Off-chain: ipfs:[CID]
- On-chain: data:application/json;base64,...

## ↔️ Transfer Functions

# safeTransferFrom(address from, address to, uint256 tokenId)

_Safely transfers NFT:_

- Validates recipient can receive ERC721

- Clears approvals

- Emits Transfer event

_Requirements:_

- Caller must be owner or approved

- tokenId must exist

_Safety Check_

Verifies recipient can handle ERC721

_Data Parameter_

✅ Accepts optional data field

# transferFrom(address from, address to, uint256 tokenId)

# transferFrom(address from, address to, uint256 tokenId, bytes data)

_Requirements:_

- Caller must be owner or approved

- tokenId must exist

_Safety Check_

No recipient validation

_Data Parameter_

❌ Not available

## 🔐 Approval System

# approve(address operator, uint256 tokenId)

Grants single-NFT transfer rights
Cleared automatically on transfer

# getApproved(uint256 tokenId) → address

**Returns**: Approved address for specific NFT

# setApprovalForAll(address operator, bool approved)

Whitelist operator for ALL NFTs

# isApprovedForAll(address owner, address operator) → bool

**Checks**: If operator has full approval

## 👑 Ownership Management

## owner() → address

**Returns**: Contract admin address

## transferOwnership(address newOwner)

Transfers contract control
**Callable by**: Current owner only

## renounceOwnership()

_Permanently:_

Removes all admin rights

Sets owner to address(0)
Irreversible: Cannot be undone
Effects:

Disables all owner-only functions

Makes contract fully immutable
