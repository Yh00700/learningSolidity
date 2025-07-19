// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProfileStatus {
    struct Status{
        string name;
        string message;
    }

    //构建一个key为address，value为构造函数的map
    mapping (address => Status) private userStatus;

    function createOrUpdateStatus (string memory _name, string memory _message) public {
        // 往map里面添加一条key为地址，value为构造函数的数据，并将name赋值
        userStatus[msg.sender].name = _name;
         // 往map里面添加一条key为地址，value为构造函数的数据，并将message赋值
        userStatus[msg.sender].message = _message;
    }

    function getStatus() public view returns (string memory, string memory) {
        return (userStatus[msg.sender].name, userStatus[msg.sender].message);
    }
}