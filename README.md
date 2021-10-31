# The HACK Experiment
Welcome the new Community Token of Hackout - HACK.

## Inspiration

Hackout has always tried to be a community play led by the finest people from Headout. Nevertheless, we also want the community to be involved and partake not only in participation but in every other activity possible. HACK is our way of giving this community value via decentralized mechanisms. A custom Crypto token is nothing but the accrued value of the utility flowing through its community and network. It is the currency, value & money of the community all combined. It leads to community incentivization & coordination. HACK is an experiment for the same, for us & the community to see, feel & experience how such token economics can be made to work.

## HACK Token

HACK Tokens are ERC-20 tokens that will be deployed on Polygon. Whenever HACK Tokens are minted (restrictive mechanisms), they will always be transferred to Hackout Treasury. This Treasury is a Gnosis Safe Multisig with a 4/7 sign requirement.

Contract: 0x7c4f9192670b485963b2caf43c94bcf82a58899c

Hackout Treasury Multisig: 0xd6752f76aA7B031030F8189Ef9799a5BE3abdf98

Signees: Hackout Organizers

- Vikram Jit Singh
- Neil Agarwal
- Ekansh Bansal
- Somesh Koli
- Garvit Chittora
- Anurag Patil
- Alpesh Vas

## Mint Schedule

HACK Tokens can be minted only once a year. This goes in conjunction with the fact that Hackout only happens once in a year. How the minted tokens will be managed for the rest of the year depends upon the Treasury's discretion.

HACK minting follows a Bitcoin's dis-inflationary distribution (in a little modified manner). It can loosely be correlated to the following formula:

`Mint Amount = year_diff < 16 ? 10^6 * 1/(2^(year_diff/4)) : 10^6 * 1/(2^(16/4))`  

`year_diff` - The difference in years since contract deployment.

By definition, the initial mint (which will happen in 2021) will come out to be 1,000,000 HACKs.

Given Solidity does not support Fixed or Floating point numbers, we decided to implement this in a discrete manner with fixed values being mintable each year. As a result there are rounding off's to the first digits done along with a small adjustment for future total supply sanity in the 16th year. Check the contract for exact details.

We decided to not follow the Bitcoin distribution beyond the 16 year since we wanted to maintain a minimum of 1% inflation. This theoretically should lead to better economic incentives for the Treasury to keep on re-investing the minted tokens back into the community.

## Distribution - 2021

We want HACK token distribution to always be as fair as possible. Hence we plan to distribute HACK tokens to everyone who has been involved with Hackout in a fair and equitable manner. We want it to serve as a reward for the hard work of the many involved along with a premium for the special winners.

The distribution for Hackout 2021 is represented as follows:

By our estimates we should be able to distribute HACKs to around 150 unique people during this edition of Hackout. This excludes speculators and market participants.

Since there are multiple people eligible to win in the same event, we prepared a very rough estimate of distribution per person. This chart needs to be taken with a big grain of salt since the actual number of people can differ in different teams, an event can happen multiple times over the week with several winners etc. Nevertheless it gives a very rough estimate of how the premiums of different distribution categories look like.

Hackout Treasury & Liquidity Bootstrapping have been removed from the above graph since they do not correlate to any per person distribution.

## Chain decision

It's a given that we had to choose an EVM chain. Over an above that there were 2 requirements:

1. Very low gas fees - Our participants are mostly students & Crypto normies, so for them to be able to utilize HACK and experiment with it, they need a very low gas fees environment.
2. Developed ecosystem - The ecosystem of the chain needs to be fairly developed and integrated. It should be easy to get the base token of the chain from an exchange out into the chain to be used. We also wanted good NFT ecosystem integration since HacKat NFT minting will also be happening and we plan to airdrop some HACKs for them too, so they need to live on the same chain.

Ethereum L1 unfortunately goes out because of high gas fees. That's fine. Ethereum L1 is not a chain for casual experimentation anymore.

So, we had the following options:

1. Arbitrum
2. Avalanche
3. Fantom
4. Polygon

Polygon won because of `Developed ecosystem`. Fantom was a very close second. Arbitrum still has some ways to go and entrypoints are currently mostly via Ethereum L1. Avalanche has it's own complications.

## Utility

For now the utility of the token is ecosystem rewards and incentivization.

Going forward some other usecases can be:

- Experiments in hacks by participants.
- Governance.
- Liquidity incentivization using Yield Farming.
- etc.

## Disclaimer

Crypto is risky. You could lose what you put in. But we’re headed west. This is the frontier. It's not for everyone. But we're glad you're with us on the bankless journey. - [Bankless](https://twitter.com/BanklessHQ)
