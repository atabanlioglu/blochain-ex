pragma solidity ^0.4.4;

contract IHouse {
  
  address Admin; 
  address grid = 0x0;
  uint    consumTimeOut = 5 minutes;
  uint    consumption;              // Production of electricity (consumption: positive)
  int     wallet;                   // To record loss & gain (that of house is negative -> need to pay others)      

  modifier adminOnly {
    if (msg.sender == Admin) {
      _;
    } else {
      revert();
    }
  }

  function getSortedInfo() external returns(uint consum, uint rank, uint tot, bool updated);

  function goNoGo(uint giveoutvol) returns (uint);

  function setGridAdr(address adr) adminOnly external {
    grid = adr;
  }

  function getWallet() constant returns(int) {
    return wallet;
  }
  
}