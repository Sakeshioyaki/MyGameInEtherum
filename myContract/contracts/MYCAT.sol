//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.7.0;

import "./ERC20.sol";
import "./SafeMath.sol";

contract MYCAT {
    event newCat();

    using SafeMath for uint32;
    using SafeMath for uint8;

    struct CAT {
        uint id;
        string name;
        uint8 level;
        uint32 experience; // max is 100000.
    }
    uint32 ExLevelUp = 100000;
    uint8 levelMax = 255;

    CAT[] public cats;
    uint countCat;
    uint8 exAdd = 100;

    function addCat( CAT memory u) internal {
    cats.push(u);
    }

    function levelUpCat(uint id) internal {
        require(cats[id].level < 255, "Max level !");
        cats[id-1].level.add(1);
    }

    function levelDownCat(uint id) internal {
        require(cats[id].level > 1, "Require : Level > 1 !");
        cats[id-1].level.sub(1);
    }

    function upExpCat(uint id) internal {

        if(cats[id].experience + exAdd >= ExLevelUp){
            levelUpCat(id);
            cats[id].experience = cats[id].experience + exAdd - ExLevelUp;
        }
        else
        cats[id].experience.add(exAdd);
    }

    function downExpCat(uint id) internal {
        if(cats[id].experience >= exAdd*2)
        cats[id].experience.sub(exAdd*2);
        else{
            levelDownCat(id);
            cats[id].experience = ExLevelUp - exAdd*2 + cats[id].experience;
        }
    }

    function showNameCat(uint id) public view returns (string memory) {
        return cats[id].name;
    }

    function showLevelCat(uint id) public view returns (uint8) {
        return cats[id].level;
    }

    function showExperience(uint id) public view returns (uint32) {
        return cats[id].experience;
    }
}