// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// 本案例实现了一个简单的小费罐功能：可以支付小费，提取余额
contract TipJar {
    // 定义一个地址类型的变量owner
    address public owner;
    // 关于msg.sender的理解：当部署的时候测试账号为那个  msg.sender就是那个 并初始化给owner owner不可变，测试过程中，选择不同的账户 msg.sender 的账户地址数据就是所选择的那个
    constructor() {
        // 构造器只会在初始化的时候调用一次
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not owner!");
        //_其他的逻辑
        _;
    }

    // 有payable关键字修饰的可以交易
    function tip() public payable {
        require(msg.value > 0, "You should send a tip to use this function");
    }

    // 提现
    function withdraw() public onlyOwner {
    // this指的是当前部署的合约地址是什么

        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "There are no tips to withdraw");

        // 通过payable关键字来表示owner这个地址是可以接受转账的，将所有的余额转到owner
        payable(owner).transfer(contractBalance);
    }

    function getBalance() public onlyOwner view returns (uint256) {
        
        return address(this).balance;
    }
}