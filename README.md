# Minimal NFT Marketplace

A professional "flat-file" architecture for a decentralized NFT exchange. This repository provides the core smart contracts and utility scripts required to launch an NFT trading platform.

### Core Architecture
* **NFT Minting:** Integrated ERC-721 standard with URI support.
* **Escrow-less Listing:** Users keep NFTs in their wallets until the moment of sale.
* **Atomic Swaps:** Ensuring the transfer of funds and assets happens simultaneously.

### Workflow
1. **Mint:** Create an asset using `NFT.sol`.
2. **Approve:** Grant the `Marketplace.sol` permission to transfer the asset.
3. **List:** Set a price in Wei.
4. **Buy:** A secondary user sends ETH to finalize the trade.
