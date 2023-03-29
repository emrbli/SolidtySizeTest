// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

contract TXOriginTest {
    uint256 result = 0;

    function add(uint256 a, uint256 b) external {
        if (isContract(msg.sender)) {
            revert("Contract size greater than 0.");
        }
        result = a + b;
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function isContract(address account) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }
}

interface ITXOriginTest {
    function add(uint256 a, uint256 b) external;
}

contract Attack {
    constructor(address _contract) {
        ITXOriginTest(_contract).add(3, 5);
    }

    function callOriginWithSize(address _contract) external {
        ITXOriginTest(_contract).add(3, 5);
    }
}
