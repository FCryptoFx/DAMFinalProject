// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ProjectFunder {

    //Estructura para un objeto
    struct Project {
        address owner; 
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    mapping(uint256 => Project) public projects;

    uint256 public numberOfProjects = 0;

    function createProject(address _owner, string memory _title, string memory _description, uint256 _target, uint256 _deadline, 
    string memory _image ) public returns (uint256){

        Project storage project = projects[numberOfProjects];

        /*Comprobación de que la fecha limite elegid es posterior al momento actual.
        block.timestamp hace referencia al tiempo en ese momento, por lo tanto si el project.deadline 
        es anterior a esto enviaremos un mensaje de error*/
        require(project.deadline < block.timestamp, "The deadline should be a date in the future!!"); 

        project.owner = _owner;
        project.title = _title;
        project.target = _target;
        project.deadline = _deadline;
        project.amountCollected = 0;
        project.image = _image;

        numberOfProjects ++;

        return numberOfProjects -1; //Si todo funciona bien, devolvemos el número de proyectos -1 que serà el índice del projecto mas reciente
    }

    //function donateToProject() {}

    //function getDonator(){}

    //function getProject() {}
}