# MultiSendERC20

The `MultiSendERC20` smart contract allows for sending multiple ERC20 tokens to multiple addresses in a single transaction. This can save gas costs and simplify the process of distributing tokens to many different addresses. 

## Usage

To use the `MultiSendERC20` contract, you will need to pass in the token contract address, an array of addresses to send tokens to, and an array of corresponding token amounts. The function will then transfer the tokens to the specified addresses.

```solidity
function multisendToken(
    address token,
    address[] memory _contributors,
    uint[] memory _balances
) public nonReentrant {
    // ...
}
```
For more information on how to use this contract, please refer to the comments in the code.

## Security

To ensure the security of the MultiSendERC20Token contract, we have added the ReentrancyGuard contract from the OpenZeppelin library to prevent reentrancy attacks.

## License

[MIT License](LICENSE)