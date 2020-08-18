//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.7.0;

import "./MyGame.sol";
import "./SafeMath.sol";

contract PET {
    event newCat();

    using SafeMath for uint32;
    using SafeMath for uint8;
    struct CAT{
        uint  id;
        string  name;
        uint8  level;
        uint32  experience; // max is 100000.
    }

    uint32 public ExLevelUp = 100000;
    uint8 public levelMax = 255;
    uint8 public exAdd = 100;

    CAT[] public cats;
    uint public countCat = 0 ;

    function levelUpCat(uint idCat) view public {
        require(cats[idCat].level < 255, "Max level !");
        cats[idCat].level.add(1);
    }

    function levelDownCat(uint idCat) view public {
        require(cats[idCat].level > 1, "Require : Level > 1 !");
        cats[idCat].level.sub(1);
    }

    function upExpCat(uint idCat) public {

        if(cats[idCat].experience + exAdd >= ExLevelUp){
            levelUpCat(idCat);
            cats[idCat].experience = cats[idCat].experience + exAdd - ExLevelUp;
        }
        else
        cats[idCat].experience.add(exAdd);
    }

    function downExpCat(uint idCat) public {
        if(cats[idCat].experience >= exAdd*2)
        cats[idCat].experience.sub(exAdd*2);
        else{
            levelDownCat(idCat);
            cats[idCat].experience = ExLevelUp - exAdd*2 + cats[idCat].experience;
        }
    }
    
    function showNameCat(uint idCat) public view returns (string memory) {
        return cats[idCat].name;
    }

    function showLevelCat(uint idCat) public view returns (uint8) {
        return cats[idCat].level;
    }

    function showExperience(uint idCat) public view returns (uint32) {
        return cats[idCat].experience;
    }
}