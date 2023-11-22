# Description 
The contract defines a digital asset called DegenToken that inherits the characteristics of an ERC20 token from the OpenZeppelin library. This implies that DegenToken possesses the functionalities of an ERC20 token, enabling users to transfer, mint, and burn tokens, while also empowering administrators to control who can execute these actions. Additionally, the contract has a designated owner, initially assigned to the address specified during contract creation.

The contract encompasses three primary functions:

redeemShopItems(): This function generates a string containing a list of shop items along with their corresponding prices.

redeemDGNToken(uint8 option): This function enables users to acquire a shop item by providing the item's option number. The function verifies the validity of the item option and ensures that the user possesses sufficient DGN tokens to complete the transaction. If the validation checks are successful, the function transfers the item's price to the contract owner and grants the item to the user.

getBalance(): This function retrieves and displays the user's current DGN token balance.
