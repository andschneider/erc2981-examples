//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";

contract ERC721ExtensionExample is ERC721Royalty {
    constructor() ERC721("Name", "Symbol") {
        // set royalty of all NFTs to 5%
        _setDefaultRoyalty(_msgSender(), 500);
    }

    function mint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }
}
