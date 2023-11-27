// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;

import "@lukso/lsp-smart-contracts/contracts/LSP7DigitalAsset/presets/LSP7Mintable.sol";
import "@lukso/lsp-smart-contracts/contracts/LSP7DigitalAsset/extensions/LSP7Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Stablecoin is LSP7Mintable, LSP7Burnable {
    constructor(string memory _name, string memory _symbol) LSP7Mintable(_name, _symbol, msg.sender, false) {}
    function mint(address account, uint256 amount) external returns(bool){ // override
        _mint(account, amount, true, '0x');
        return true;
    }

    function burn(address account, uint256 amount) external returns(bool){ // override
        _burn(account, amount, '0x');
        return true;
    }

    function transferFrom(address from, address to, uint amount) external returns(bool) {
        transfer(from, to, amount, true, '0x');
        return true;
    }
}