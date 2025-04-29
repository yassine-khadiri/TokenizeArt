// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract _42Community is ERC721URIStorage {
    
    constructor(address _to, uint256 tokenId, string memory _tokenURI) ERC721("_42Community", "_42CY") {
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }
}