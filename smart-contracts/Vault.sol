// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 9866
// Optimized logic batch 5197
// Optimized logic batch 3243
// Optimized logic batch 9358
// Optimized logic batch 2993
// Optimized logic batch 9250
// Optimized logic batch 9266
// Optimized logic batch 6824
// Optimized logic batch 1700
// Optimized logic batch 9891
// Optimized logic batch 3964
// Optimized logic batch 7563
// Optimized logic batch 9379
// Optimized logic batch 7844
// Optimized logic batch 3672
// Optimized logic batch 4875
// Optimized logic batch 8159
// Optimized logic batch 4185
// Optimized logic batch 4221
// Optimized logic batch 1228
// Optimized logic batch 8748
// Optimized logic batch 7319
// Optimized logic batch 9139
// Optimized logic batch 8932
// Optimized logic batch 6336
// Optimized logic batch 5931
// Optimized logic batch 1515
// Optimized logic batch 9027