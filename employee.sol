pragma solidity 0.4.25;

contract EmployeeManagement {
    struct Employee {
        uint id;
        bytes32 firstname;
        bytes32 lastname;
    }
    
    mapping (uint => Employee) employeeMap;
    
    Employee[] employees;
    
    function AddEmployee(uint _id, bytes32 _firstname, bytes32 _lastname) public {
        employeeMap[_id].id = _id;
        employeeMap[_id].firstname = _firstname;
        employeeMap[_id].lastname = _lastname;
        employees.push(employeeMap[_id]);
    }
    
    function ListEmployee() public view returns (uint[], bytes32[], bytes32[]) {
        
        uint[] memory ids = new uint[](employees.length);
        bytes32[] memory firstnames = new bytes32[](employees.length);
        bytes32[] memory lastnames = new bytes32[](employees.length);
        
        for(uint i=1; i <= employees.length; i++) {
            ids[i-1] = employeeMap[i].id;
            firstnames[i-1] = employeeMap[i].firstname;
            lastnames[i-1] = employeeMap[i].lastname;
        }
        
        return (ids, firstnames, lastnames);
        
    }
    
    function GetEmployee(uint _id) public view returns (uint, bytes32, bytes32) {
        return (employeeMap[_id].id,employeeMap[_id].firstname,employeeMap[_id].lastname);
    }
    
}

