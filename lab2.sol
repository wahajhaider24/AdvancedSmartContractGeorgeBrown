pragma solidity ^0.8.0;

contract lab2Caller{

    uint256 public changeState=0;

     function checkContractCode(address contractAdd)public view returns (bool ){
            uint codeSize;
        assembly {
            codeSize := extcodesize(contractAdd)
        }
        if(codeSize>0)
        {
            return true; 
        }
        else
        {
            return false; 
        }
    
     }

     function delegateCall(address callee, uint256 _newValue) public {
           (bool success, ) = callee.delegatecall(
               abi.encodeWithSelector(
                   lab2Callee.setValue.selector, _newValue
                   )
            );
        require(success, "Delegate call failed");
     }

    
}

contract lab2Callee{

    uint256 public changeState=0;

    function setValue(uint256 _newValue) public {
        changeState= _newValue;
    }


}