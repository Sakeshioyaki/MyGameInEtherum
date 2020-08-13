//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.7.0;

import "./MyGame.sol";
import "./SafeMath.sol";

contract MYCAT {
    event newCat();

    uint public id;
    string public name;
    uint8 public level;
    uint32 public experience; // max is 100000.

    using SafeMath for uint32;
    using SafeMath for uint8;

    uint32 public ExLevelUp = 100000;
    uint8 public levelMax = 255;

    uint public countCat;
    uint8 public exAdd = 100;

    constructor(uint idCat, string memory nameCat) {
        id = idCat;
        name = nameCat;
    }

    function levelUpCat() view public {
        require(level < 255, "Max level !");
        level.add(1);
    }

    function levelDownCat() view public {
        require(level > 1, "Require : Level > 1 !");
        level.sub(1);
    }

    function upExpCat() public {

        if(experience + exAdd >= ExLevelUp){
            levelUpCat();
            experience = experience + exAdd - ExLevelUp;
        }
        else
        experience.add(exAdd);
    }

    function downExpCat() public {
        if(experience >= exAdd*2)
        experience.sub(exAdd*2);
        else{
            levelDownCat();
            experience = ExLevelUp - exAdd*2 + experience;
        }
    }
    
    function showNameCat() public view returns (string memory) {
        return name;
    }

    function showLevelCat() public view returns (uint8) {
        return level;
    }

    function showExperience() public view returns (uint32) {
        return experience;
    }
}