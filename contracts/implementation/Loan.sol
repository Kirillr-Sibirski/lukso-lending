// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;

import "@lukso/lsp-smart-contracts/contracts/LSP8IdentifiableDigitalAsset/presets/LSP8Mintable.sol";
import "@lukso/lsp-smart-contracts/contracts/LSP8IdentifiableDigitalAsset/extensions/LSP8Burnable.sol";

contract LoanStatistics is LSP8Mintable, LSP8Burnable {
  constructor(string memory _name, string memory _symbol) LSP8Mintable(_name, _symbol, msg.sender, 1) {}
    function mint(address account, bytes memory data) public returns(bool){ // override
        bytes32 converted = bytes32(uint256(uint160(account)) << 96); // Convert address to bytes
        _mint(account, converted, true, data);
        return true;
    }

    function burn(address account) external returns(bool){ // override
        bytes32 converted = bytes32(uint256(uint160(account)) << 96); // Convert address to bytes
        _burn(converted, '0x');
        return true;
    }
}