// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./IUniswapRouterV2.sol";
import "./IUniswapV2Pair.sol";

contract QtumToken is ERC20 {
    using SafeMath for uint256;
    address private constant UNISWAPROUTERV2 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private PAIR = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    constructor() ERC20("QTUM", "QTUM") {
        _mint(msg.sender, 10_000_000 * 10 **  decimals());
    }
}