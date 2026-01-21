// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Marketplace is ReentrancyGuard {
    struct Listing {
        address seller;
        address nftAddress;
        uint256 tokenId;
        uint256 price;
    }

    mapping(address => mapping(uint256 => Listing)) public listings;

    function listNft(address nftAddress, uint256 tokenId, uint256 price) external {
        require(price > 0, "Price must be above zero");
        IERC721(nftAddress).transferFrom(msg.sender, address(this), tokenId);
        listings[nftAddress][tokenId] = Listing(msg.sender, nftAddress, tokenId, price);
    }

    function buyNft(address nftAddress, uint256 tokenId) external payable nonReentrant {
        Listing memory listing = listings[nftAddress][tokenId];
        require(msg.value >= listing.price, "Insufficient payment");

        delete listings[nftAddress][tokenId];
        IERC721(nftAddress).safeTransferFrom(address(this), msg.sender, tokenId);
        payable(listing.seller).transfer(msg.value);
    }
}
