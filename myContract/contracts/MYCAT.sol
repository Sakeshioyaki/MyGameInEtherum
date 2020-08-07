//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.7.0;

import "./MyGame.sol";
import "./SafeMath.sol";

abstract contract MYCAT {
    event newCat();

    uint id;
    string name;
    uint8 level;
    uint32 experience; // max is 100000.

    using SafeMath for uint32;
    using SafeMath for uint8;

    uint32 ExLevelUp = 100000;
    uint8 levelMax = 255;

    uint countCat;
    uint8 exAdd = 100;

    function levelUpCat() internal {
        require(level < 255, "Max level !");
        level.add(1);
    }

    constructor(uint id, string name) {
        this.id = id;
        this.name = name;
    }

    function levelDownCat() internal {
        require(level > 1, "Require : Level > 1 !");
        level.sub(1);
    }

    function upExpCat() internal {

        if(experience + exAdd >= ExLevelUp){
            levelUpCat(id);
            experience = experience + exAdd - ExLevelUp;
        }
        else
        experience.add(exAdd);
    }

    function downExpCat() internal {
        if(experience >= exAdd*2)
        experience.sub(exAdd*2);
        else{
            levelDownCat(id);
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