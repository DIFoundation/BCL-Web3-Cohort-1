// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Class1 {

    uint private age = 21;
    string private name = "Ibrahim";
    bool private isStudent = true;
    address public owner;

    string[] public students;

    constructor() {
        owner = msg.sender;
    }

    // Function to update age
    function setAge(uint _newAge) public returns(uint) {
        age = _newAge;

        return age;
    }

    // Function to update name
    function setName(string memory _newName) public {
        name = _newName;
    }

    // Function to toggle student status
    function toggleStudentStatus() public {
        isStudent = !isStudent;
    }

    // getter function

     function getDetails()
        public
        view
        returns (
            string memory,
            uint,
            bool,
            address
        )
    {
        return (name, age, isStudent, owner);
    }

     function addStudent(string memory _studentName) public {
        students.push(_studentName);
    }

    function getAllDetails() public view returns (string[] memory) {
        return  (students);
    }

    function compareStrings(
        string memory text1,
        string memory text2
    )
        public
        view
        returns (bool)
    {
        getAllDetails();
        return keccak256(abi.encodePacked(text1))
            ==
            keccak256(abi.encodePacked(text2));
    }


    // View     &&  Pure
    //  Returns &&  Return

}