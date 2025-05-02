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
        string svgText;
        Attributes attributes;
    }

    NFTMetaData public onChainNFT;

    constructor() ERC721("_42Community", "_42CY") Ownable(msg.sender) {}

    function mintOffChainNFT(uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }

    function mintOnChainNFT(
            uint256 _tokenId,
            string memory _name,
            string memory _description,
            string memory _svgText,
            string memory _artistName) public onlyOwner {

            Attributes memory _attr = Attributes({trait_type: "Artist", value: _artistName});

            onChainNFT.name = _name;
            onChainNFT.description = _description;
            onChainNFT.svgText = _svgText;
            onChainNFT.attributes = _attr;

            _safeMint(msg.sender, _tokenId);
            _setTokenURI(_tokenId, _generateTokenURI());
        }

    function _generateSVG() internal view returns (string memory) {
        return string(abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">',
            '<rect width="100%" height="100%" fill="#ffffff"/>',
            '<text x="50%" y="50%" font-family="Arial" font-size="2" fill="#000000" ',
            'text-anchor="middle" dominant-baseline="middle">',
            onChainNFT.svgText,
            '</text></svg>'
        ));
    }

    function _generateTokenURI() internal view returns (string memory) {

        // First encode the SVG to Base64
        string memory svgBase64 = Base64.encode(bytes(_generateSVG()));
        
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(bytes(abi.encodePacked(
                    '{"name":"', onChainNFT.name, '",',
                    '"description":"', onChainNFT.description, '",',
                    '"image":"data:image/svg+xml;base64,', svgBase64, '",',
                    '"attributes":[{"trait_type":"Artist","value":"', onChainNFT.attributes.value, '"}]}'
                )))
            )
        );
    }

}