// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract _42Community is ERC721URIStorage, Ownable {

    // Struct to store NFT attributes
    struct Attributes {
      string trait_type;
      string value;
    }

    // Struct to store NFT metadata
    struct NFTMetaData {
        string name;
        string description;
        string image; // Could be SVG or base64 encoded image
        Attributes attributes;
    }

    NFTMetaData private onChainNFT;

    constructor() ERC721("_42Community", "_42CY") Ownable(msg.sender) {}

    function mintOffChainNFT(uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }

    function mintOnChainNFT(
            uint256 tokenId,
            string memory name,
            string memory description,
            string memory image,
            string memory value) public onlyOwner {

            Attributes memory attr = Attributes({trait_type: "Artist", value: value});

            onChainNFT.name = name;
            onChainNFT.description = description;
            onChainNFT.image = image;
            onChainNFT.attributes = attr;

            _safeMint(msg.sender, 0);
            _setTokenURI(tokenId, _generateTokenURI());
        }

    // Generate on-chain metadata URI
    function _generateTokenURI() internal view returns (string memory) {

         string memory metadata = string(abi.encodePacked(
            '{"name": "', onChainNFT.name, '", ',
            '"description": "', onChainNFT.description, '", ',
            '"image": "', onChainNFT.image, '", ',
            '"attributes": [{',
                '"trait_type": "', onChainNFT.attributes.trait_type, '", ',
                '"value": "', onChainNFT.attributes.value, '"',
            '}]}'
        ));
    
        
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(bytes(metadata))
            )
        );
    }
}