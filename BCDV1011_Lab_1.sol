// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

 

contract BCDV1011_Lab_1 { 
// Setting the variable 'owner' to the address of the contract deployer. 
    address owner;

    constructor(){ 
        owner = msg.sender; 
    } 

// Create a modifier to ensure the current address interacting with a 

// particular function, is the same as the contract owner(deployer). 
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
 
// Create another modifier to ensure a student mark is between 0 and 100. 
    modifier onlyMark(uint8 _mark){
        require(_mark >= 0);
        require(_mark <= 100);
        _;
    }

     struct Student { 

        string name; 

        string subject; 

         uint8 mark; 

     } 


    event StudentAdded( 

        string content 

     ); 

 
 

    mapping (address => Student) students; 

 

    uint mapSize; 



    function  adding_values (address _address, string memory _name, string memory _subject, uint8 _mark) public onlyMark(_mark){ 
 

    Student storage student = students[_address]; 

         student.name = _name; 

        student.subject = _subject; 
        
        student.mark = _mark; 

         // increase the map size by +1 for the new student. 

         mapSize++; 
        
         //  
        
        emit StudentAdded("Student added successfully."); 


    } 




    function get_student_info (address _address) view public  onlyOwner returns (string memory, string memory, uint8){ 

         string memory _name = students[_address].name; 

        string memory _subject = students[_address].subject; 

        uint8 _mark = students[_address].mark; 
        
        return (_name, _subject, _mark); 

    } 


    function count_students() view public returns (uint) { 

         return mapSize; 

 

    } 

} 

 