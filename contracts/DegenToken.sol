// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

     mapping(uint8 => uint256) public itemPrices;

    constructor(address initialOwner) 
        ERC20("Degen", "DGN") 
        Ownable(initialOwner)
    {
        itemPrices[1] = 100; // Price of item 1 (DGN NFT)
        itemPrices[2] = 200; // Price of item 2 (DGN Merch)
        itemPrices[3] = 50; // Price of item 3 (DGN Mystery Box)
    }

    function mintDGNToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns(uint8){
        return 0;
    }

    function getBalance() external view returns(uint256){
        return this.balanceOf(msg.sender);
    }

    function transferDGNToken(address _to, uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Transfer Error: Insufficient token balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function burnDGNToken(uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Burn Error: Burn amount exceeds token balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function redeemShopItems() public pure returns(string memory){
        string memory items = "Degen Shop Items: 1. DGN NFT(100 DGN)\n2. DGN Merch(200 DGN)\n3. DGN Mystery Box(50 DGN)";
        return items;
    }

    function redeemDGNToken(uint8 option) external {
        require(itemPrices[option] > 0, "Invalid item option.");
        require(option <= 3, "Invalid item option");
        require(balanceOf(msg.sender) >= itemPrices[option], "Insufficient funds to redeem the item.");

        transfer(owner(), itemPrices[option]);
    }

}
