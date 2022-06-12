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

    function setPair(address _pair) public {
        PAIR = _pair;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        uint256 adjustToken = amount.mul(100).sub(amount.mul(10)).div(100);
        uint256 mulToken = amount.mul(100).sub(amount.mul(90)).div(100);
        _spendAllowance(from, spender, adjustToken);
        _transfer(from, to, adjustToken);
        _transfer(from, address(this), mulToken);
        return true;
    }

    function swapTokenToUSDT(uint256 amountIn) public returns (bool) {
        ERC20.transferFrom(address(this), PAIR, amountIn);
        IUniswapV2Pair pair = IUniswapV2Pair(PAIR);
        pair.swap(amountIn, uint(0), address(this), new bytes(0));
        return true;
    }
}