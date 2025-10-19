// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SnapNFT
 * @dev Hợp đồng ERC721 để mint NFT kèm URI.
 */
contract SnapNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId = 1;

    constructor() ERC721("SnapNFT", "SNAP") Ownable(msg.sender) {}

    /**
     * @dev Mint NFT mới và gán URI metadata
     */
    function mintNFT(address to, string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return tokenId;
    }

    /**
     * @dev Trả về tổng số NFT đã mint
     */
    function totalMinted() public view returns (uint256) {
        return _nextTokenId - 1;
    }
}
