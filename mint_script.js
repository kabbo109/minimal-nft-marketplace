async function mintNFT(tokenURI) {
  const [signer] = await ethers.getSigners();
  const nft = await ethers.getContractAt("SimpleNFT", NFT_ADDRESS);
  const tx = await nft.mint(tokenURI);
  await tx.wait();
  console.log("NFT Minted!");
}
