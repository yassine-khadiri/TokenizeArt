// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract _42Community is ERC721URIStorage, Ownable {

    constructor() ERC721("_42Community", "_42CY") Ownable(msg.sender) {}

    function mintNFT(uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }
}