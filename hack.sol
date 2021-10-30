// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./util/DateTime.sol";

/**
    Hackout Community Token.
    Initial Mint: 1M
    Tokens can only be minted once a year.
    Minting follows a Bitcoin style dis-inflationary distribution curve which becomes a constant after 16 years (~ 1% inflation). 
    Distribution curve ~: YEAR_DIFF < 16 ? INITIAL_MINT * 1/(2**(YEAR_DIFF/4)) : (10**6)/16
    All mints goto `HACKOUT_TREASURY_MULTISIG`.
 */
contract HACK is ERC20 {

    //------------------------------
    // Constants
    //------------------------------

    // The initial mint.
    uint32 public constant INITIAL_MINT = 1000000;   // 1M

    // Hackout's Gnosis Safe Multisig.
    address public constant HACKOUT_TREASURY_MULTISIG = 0xd6752f76aA7B031030F8189Ef9799a5BE3abdf98;

    // Map for actual mint count for corresponding year.
    // We could have used a `bool` value too, but lets just store the minted count for fun. It will increase contract used space though.
    // We will support almost infinite years. :)
    mapping(uint => uint32) public mapYearlyMint;
    
    // Year of deployment & first mint.
    uint public startYear;
    
    DateTime private _dateTime = new DateTime();



    //------------------------------
    // Functions
    //------------------------------

    /**
        Mint `INITIAL_MINT` tokens on construction.
        All tokens always goto Hackout's Treasury.
     */
    constructor () ERC20("Hackout", "HACK") {
        // Initialize start year and yearly mint info. 
        startYear = _dateTime.getYear(block.timestamp);
        assert(startYear == 2021);
        mapYearlyMint[startYear] = INITIAL_MINT;

        // MINT.
        _mint(HACKOUT_TREASURY_MULTISIG, uint256(INITIAL_MINT) * (10**18));   // Accounts for the default 18 decimals
    }

    /**
        Mint fresh tokens. Can only be minted by Hackout's Treasury Multisig (not really a required restriction though).
        Tokens can only be minted once a year.
        Minting follows a Bitcoin style dis-inflationary distribution curve.
        Minting will not go below INITIAL_MINT/16.
    */
    function mint() external {
        // This isn't per-se required since the mint always goes to HACKOUT_TREASURY_MULTISIG and is restrictive even to HACKOUT_TREASURY_MULTISIG on the same levels.
        // Nevertheless, didn't want to be surprised to see newly minted HACKs every other year, lets say, when they are not actually required.
        // Minting enabled to anyone did look cool though...
        require(_msgSender() == HACKOUT_TREASURY_MULTISIG, "Only Hackout Tresury Multisig can mint.");

        // Get current year, assert validity and find diff.
        uint currentYear = _dateTime.getYear(block.timestamp);
        require(mapYearlyMint[currentYear] == 0, "Minting for the year already done.");
        assert(currentYear > startYear);
        uint yearNumberFromStart;
        unchecked {
            yearNumberFromStart = currentYear - startYear;
        }

        // We need to evaluate `INITIAL_MINT * 1/(2**(yearNumberFromStart/4))`.
        // Solidity does not support Fixed or Floating point numbers (latter is understandable; former is under works) and hence we cannot use fractional exponentialization. 
        // There are other complex mechanisms to evaluate this though.
        // So we will now have to hardcode 16 values.
        // But Solidity also does not support SWITCH!!!
        // So we need to fallback to using multiple IF statements.
        // Remind me what year this is again?!
        uint32 mintAmount;
        if(yearNumberFromStart == 1)
            mintAmount = 840896;
        if(yearNumberFromStart == 2)
            mintAmount = 707106;
        if(yearNumberFromStart == 3)
            mintAmount = 594603;
        if(yearNumberFromStart == 4)
            mintAmount = 500000;
        if(yearNumberFromStart == 5)
            mintAmount = 420448;
        if(yearNumberFromStart == 6)
            mintAmount = 353553;
        if(yearNumberFromStart == 7)
            mintAmount = 297301;
        if(yearNumberFromStart == 8)
            mintAmount = 250000;
        if(yearNumberFromStart == 9)
            mintAmount = 210224;
        if(yearNumberFromStart == 10)
            mintAmount = 176776;
        if(yearNumberFromStart == 11)
            mintAmount = 148650;
        if(yearNumberFromStart == 12)
            mintAmount = 125000;
        if(yearNumberFromStart == 13)
            mintAmount = 105112;
        if(yearNumberFromStart == 14)
            mintAmount = 88388;
        if(yearNumberFromStart == 15)
            mintAmount = 74325;
        if(yearNumberFromStart == 16)
            mintAmount = 62618; // 62500+118 ; Brings the whole total to a forever 500 multiple. 
        if(yearNumberFromStart > 16)
            mintAmount = 62500;

        // MINT.
        mapYearlyMint[currentYear] = mintAmount;
        _mint(HACKOUT_TREASURY_MULTISIG, uint256(mintAmount) * (10**18)); // Accounts for the default 18 decimals
    }    
}