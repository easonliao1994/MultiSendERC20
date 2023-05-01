// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MultiSendERC20 is Ownable, Pausable, ReentrancyGuard {

    function multisendToken(
        address token,
        address[] memory _contributors,
        uint[] memory _balances
    ) public nonReentrant {
        require(_contributors.length == _balances.length, "Invalid input: contributors and balances length mismatch");
        ERC20 erc20 = ERC20(token);
        for (uint i = 0; i < _contributors.length; i++) {
            require(_safeERC20Transfer(erc20, _contributors[i], _balances[i]), "Transfer failed: multisendToken");
        }
    }

    function _safeERC20Transfer(ERC20 _token, address _to, uint _amount) internal returns (bool success) {
        success = _token.transferFrom(msg.sender, _to, _amount);
        require(success, "Transfer failed");
    }

}
