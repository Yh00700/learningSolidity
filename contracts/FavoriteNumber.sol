// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// 本案例实现了用户存储和检索与名字关联的喜好数字：

contract FavoriteNumber {

    // 定义一个map
    mapping(string => uint256) private nameToFavoriteNumber;

    function createOrUpdateFavoriteNumber(string memory name, uint256 number) public {
        // 赋值 构建一条 key为name，value为number的map数据
        nameToFavoriteNumber[name] = number;
    }

    // 有view修饰 不用gas  。 复杂的可变的变量 需要用 memory修饰
    function getNumber(string memory name) public view returns(uint256) {
        return nameToFavoriteNumber[name];
    }
}