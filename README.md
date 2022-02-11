# ERC-2981 examples

This repo has two small examples showing how to integrate OpenZeppelin's
ERC-2981 implementation with ERC-721 and ERC-1155 NFT contracts.

## What is ERC 2981?

[ERC 2981](https://eips.ethereum.org/EIPS/eip-2981) is a standard way to encode
royalty information in a smart contract. This helps ensure that the NFT creator
or rights holder gets paid the correct amount of royalties every time the NFT is
sold or re-sold.

> It is important to note that this is simply a standard. It is up to ecosystem
> particapts, namely marketplaces, to adhere to, respect, and ultimately pay
> the royalties using this information.

## Examples

> These examples use OpenZeppelin contracts version 4.5, which is when they
> added ERC 2981 support.

There are two examples in the `contracts` directory:

- ERC721 NFT with royalties
- ERC1155 NFT with royalties

Both are simple barebone implementations, inheriteting from OpenZeppelin's
ERC2981 and their respective ERC standard contracts. Each have a public `mint`
function that allows NFTs to be minted.

> In a real contract you would likely want [access control](https://docs.openzeppelin.com/contracts/2.x/access-control)
> mechanisms. These contracts are for demo purposes only.

### Set the royalty percentage

The critial piece to look at is in the constructor, where you call
`_setDefaultRoyalty()`:

```solidity
constructor() ERC721("Name", "Symbol") {
    // set royalty of all NFTs to 5%
    _setDefaultRoyalty(_msgSender(), 500);
}
```

The first argument is the address that should receive the royalties, the second
is the percentage of the sale that should be paid to the receiver.

This number is calculated like so:

`royaltyAmount = (salePrice * royaltyFraction) / feeDenominator`,

where `feeDenominator` defaults to 10,000. So in the above constructor, with the
number set to 500, you get 500 / 10,000, or 5%. (You can change the denominator
if you like, but thats out of scope for this example.)
