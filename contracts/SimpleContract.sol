// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/*

SIMPLE SOLIDITY TUTORIAL CONTRACT

Lesson Topics Covered:
1. What is Remix IDE?
2. Contract Structure
3. Data Types and Variables
4. Functions
5. Storage vs Memory
6. State Changes on Blockchain

*/

contract SimpleContract {

    /*
    =====================================================
                        VARIABLES
    =====================================================

    Solidity Data Types:
    - uint      => positive numbers
    - string    => text
    - bool      => true or false
    - address   => wallet address
    */

    // State Variables
    uint public age = 25;

    string public name = "Ibrahim";

    bool public isStudent = true;

    address public owner;

    /*
    =====================================================
                        CONSTRUCTOR
    =====================================================

    Runs once when contract is deployed.
    */

    constructor() {
        owner = msg.sender;
    }

    /*
    =====================================================
                        FUNCTIONS
    =====================================================
    */

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

    /*
    =====================================================
                    VIEW FUNCTION
    =====================================================

    View functions only READ data.
    They do not change blockchain state.
    */

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

    /*
    =====================================================
                STORAGE VS MEMORY
    =====================================================

    STORAGE:
    - Permanent blockchain data
    - Expensive (gas fees)

    MEMORY:
    - Temporary data used inside functions
    - Cheaper
    */

    string[] public students;

    // STORAGE example
    function addStudent(string memory _studentName) public {
        students.push(_studentName);
    }

    // MEMORY example
    function compareStrings(
        string memory text1,
        string memory text2
    )
        public
        pure
        returns (bool)
    {
        return keccak256(abi.encodePacked(text1))
            ==
            keccak256(abi.encodePacked(text2));
    }

    /*
    =====================================================
                    PURE FUNCTION
    =====================================================

    Pure functions do not:
    - Read blockchain data
    - Modify blockchain data
    */

    function addNumbers(uint a, uint b)
        public
        pure
        returns (uint)
    {
        return a + b;
    }
}