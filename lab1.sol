pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract lab03{
    using SafeMath for uint;
    uint256[] arr;


    constructor(uint256[] memory _arr)
    {
        arr=_arr;
    } 

    function sortAccending() public  returns (uint256[] memory )
    {
        for (uint i = 0; i < arr.length-1; i++) {
            for (uint j = 0; j < arr.length-1; j++) {
                if (arr[j] > arr[j+1]) {
                   
                    (arr[j], arr[j+1]) = (arr[j+1], arr[j]);
                }
            }
        }
        
        return arr;

    }

    function findDuplicates() public returns (uint[] memory) {
        uint[] memory duplicates = new uint[](arr.length);
        uint numDuplicates = 0;

        for (uint i = 0; i < arr.length; i++) {
            for (uint j = i+1; j < arr.length; j++) {
                if (arr[i] == arr[j]) {
                    bool alreadyAdded = false;
                    for (uint k = 0; k < numDuplicates; k++) {
                        if (duplicates[k] == arr[i]) {
                            alreadyAdded = true;
                            break;
                        }
                    }

                    if (!alreadyAdded) {
                        duplicates[numDuplicates] = arr[i];
                        numDuplicates.add(1);
                    }
                    break;
                }
            }
        }

        return duplicates;
    
    }




}