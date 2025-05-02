// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract _42Community is ERC721URIStorage, Ownable {
    using Strings for uint256;

    uint256 constant WIDTH = 200;
    uint256 constant HEIGHT = 200;
    
    struct SVGParams {
        string bgColor;
        string text;
        string textColor;
        uint256 fontSize;
    }

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

    NFTMetaData public onChainNFT;

    constructor() ERC721("_42Community", "_42CY") Ownable(msg.sender) {}

    function mintOffChainNFT(uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }

    function mintOnChainNFT(
            uint256 tokenId,
            string memory name,
            string memory description,
            SVGParams memory svgParams,
            string memory artistName) public onlyOwner {

            Attributes memory attr = Attributes({trait_type: "Artist", value: artistName});

            onChainNFT.name = name;
            onChainNFT.description = description;
            onChainNFT.attributes = attr;

            _safeMint(msg.sender, 0);
            _setTokenURI(tokenId, _generateTokenURI(svgParams));
        }

    function _generateSVG(SVGParams memory params) internal   {

        onChainNFT.image = string(abi.encodePacked(
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ',
                WIDTH.toString(), ' ', HEIGHT.toString(), '">',
                '<rect width="100%" height="100%" fill="', params.bgColor, '"/>',
                '<text x="50%" y="50%" font-family="Arial" font-size="',
                params.fontSize.toString(), '" fill="', params.textColor,
                '" text-anchor="middle" dominant-baseline="middle">',
                params.text,
                '</text></svg>'
            ));
    }

    // Generate on-chain metadata URI
    function _generateTokenURI(SVGParams memory params) internal returns (string memory) {

        _generateSVG(params);

         string memory metadata = string(abi.encodePacked(
            '{"name": "', onChainNFT.name, '", ',
            '"description": "', onChainNFT.description, '", ',
            '"image":"data:image/svg+xml,', onChainNFT.image, '",',
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