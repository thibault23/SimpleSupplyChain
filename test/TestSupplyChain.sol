pragma solidity ^0.6.12;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    // Test for failing conditions in this contracts:
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests

    /*
    SupplyChain public supplyChain;

    // Run before every test function
    function beforeEach() public {
        supplyChain = new SupplyChain();
    }
    */
    /*
    function checkName() public {
        string memory nameSku = "toto";
        uint price = 10;
        //supplyChain.addItem(nameSku, price);
        //"as far as I know struct data storage is internal to a contract and not portable between contracts."
        //not possible to pass struct internally??
        //string memory result = supplyChain.items[0].name;
        //Assert.equal(result, nameSku, "it should be equal");
    }
    */

    function checkSkuCount() public {
        //string memory nameSku = "toto";
        uint price = 10;
        SupplyChain supplychain = new SupplyChain();
        uint skuCountHere = 1;
        supplychain.addItem("book", price);
        //"as far as I know struct data storage is internal to a contract and not portable between contracts."
        //not possible to pass struct internally??
        uint resultSkuCount = supplychain.returnSkuCount();
        //uint resultSkuCount = 2;
        Assert.equal(skuCountHere, resultSkuCount, "it should be equal");
    }

    /*
    SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
    uint skuPrice = 2;
    string skuName = "";

    function testAddItem() public {
      SupplyChain supplyChain = new SupplyChain();
      ThrowProxy throwproxy = new ThrowProxy(address(supplyChain));
      SupplyChain(address(throwproxy)).addItem(skuName,skuPrice);
      bool r = throwproxy.execute.gas(200000)();

      Assert.isFalse(r, "should be false as require doesn't pass");
    }
    */
    // buyItem

    // test for failure if user does not send enough funds
    // test for purchasing an item that is not for Sale

    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

}

/*
// Proxy contract for testing throws
contract ThrowProxy {
  address public target;
  bytes data;

  function ThrowProxy(address _target) {
    target = _target;
  }

  //prime the data using the fallback function.
  fallback() external{
    data = msg.data;
  }

  function execute() returns (bool) {
    return target.call(data);
}
}
*/
