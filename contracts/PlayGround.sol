// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Class1 {

    uint public age = 25;
    string public name = "Ibrahim";
    bool public isStudent = true;
    address public owner;

    constructor(address _deployer) {
        owner = _deployer;
    }

    // Function to update age
    function setAge(uint _newAge) public {
        age = _newAge;
    }

    // Function to update name
    function setName(string memory _newName) public {
        name = _newName;
    }

    // Function to toggle student status
    function toggleStudentStatus() public {
        isStudent = !isStudent;
    }

}