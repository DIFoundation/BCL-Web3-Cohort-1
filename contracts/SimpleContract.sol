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
6. Arrays
7. Mapping
6. State Changes on Blockchain
8. View and Pure Function

*/

contract SimpleContract {

    /*
    =====================================================
                        STATE VARIABLES
    =====================================================

    Solidity Data Types:
    Common Data Type
    - uint      => positive numbers
    - string    => text
    - bool      => true or false
    - address   => wallet address

    Uncommon Data Type
    - int
    - byte
    - bytes

    */

    // State Variables
    uint public age = 25;

    string public name = "Ibrahim";

    bool public isStudent = true;

    address public owner;

    /*
    =====================================================
                        ARRAYS
    =====================================================
    */

    string[] public students;

    /*
    =====================================================
                        MAPPINGS
    =====================================================

    Mapping Syntax:
    mapping(KeyType => ValueType)

    Example:
    address => uint
    */

    // Store balances of users
    mapping(address => uint) public balances;

    // Store student names using ID
    mapping(uint => string) public studentNames;

    // Check if a user is registered
    mapping(address => bool) public registeredUsers;


    /*
    =====================================================
                        CONSTRUCTOR
    =====================================================
    */

    constructor() {
        owner = msg.sender;
    }

    /*
    =====================================================
                        BASIC FUNCTIONS
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
                    ARRAY FUNCTIONS
    =====================================================
    */

    function addStudent_(string memory _studentName) public {
        students.push(_studentName);
    }

    function getTotalStudents() public view returns(uint) {
        return students.length;
    }

    /*
    =====================================================
                    MAPPING FUNCTIONS
    =====================================================
    */

    // Add balance to sender
    function addBalance(uint _amount) public {
        balances[msg.sender] += _amount;
    }

    // Register a user
    function registerUser() public {
        registeredUsers[msg.sender] = true;
    }

    // Save student name using ID
    function setStudentName(
        uint _id,
        string memory _studentName
    )
        public
    {
        studentNames[_id] = _studentName;
    }

    // Read student name
    function getStudentName(uint _id)
        public
        view
        returns(string memory)
    {
        return studentNames[_id];
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