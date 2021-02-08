# About

**Note**: This is used as a proof-of-concept as a partial ERC-20 Token implementation. This implementation should not be used for production purposes.

This repo is a starter template for the Solidity Workshop

## Instructions for Deployment

Before you begin...

- Open and Log into [Portis](https://wallet.portis.io)
- Open [Code Sandbox](https://codesandbox.io/s/test-dapp-yj3e6)
- Open [Remix IDE](https://remix.ethereum.org)
- Open [Ganache Faucet](https://pavelsinelnikov.duckdns.org/faucet)

### Steps

#### Deploying the Token (Remix IDE)

1. Copy the `Token.sol` contract code in this repo
2. Navigate to Remix IDE
3. Click the small "file" icon and name the file `Token.sol`
4. Paste the contract code
5. Navigate to the Solidity Compiler tab in the Remix IDE
6. Select the correct version (0.8.0)
7. Compile the contract on the Remix IDE **Note**: This step generates the ABI
8. Navigate to the Deploy Contract tab in the Remix IDE
9. Select Web3 Provider in the Dropdown
10. Paste: https://pavelsinelnikov.duckdns.org/ganache and press OK
11. Provide the constructor information: Name, Symbol, and Receiving Account (See **Portis Wallet** section)
12. press the Orange Deploy the contract **Note**: This step generates the Contract Address
13. Copy the Contract Address
14. Go to the Code Standbox section

#### Portis Wallet

1. Select your Ethereum Account
2. Click "Receive"
3. Click "Copy"

#### Connecting the Backend (Code Sandbox)

1. Navigate to the `/src/components/SendTransferForm.js` file
2. Scroll down until you see the `async ComponentDidMount()` function
3. Uncomment and paste the Contract Address:

```js
const contractAddress = '0x123456789abcdef...'; // <- Insert the Contract Address here
```

4. Uncomment the contract:

```js
const contract = new web3.eth.Contract(abi, contractAddress);
```

5. Navigate to the `/src/abi.js` file
6. Uncomment:

```js
export default
```

#### Applying the ABI

1. Navigate back to the Remix IDE
2. Select the Compile Contract tab
3. Copy the ABI located after the "Deploy to Swarm" button
4. Navigate back to Code Sandbox's `abi.js`
5. Paste the ABI after the `export default`

#### Connecting the Smart Contract cont.

1. Navigate back to `/src/components/SendTransferForm.js`
2. Scroll down until you see the `async ComponentDidMount()` function
3. Uncomment:

```jsx
this.setState({
	contract,
	tokenName: await contract.methods.name().call(),
	tokenSymbol: await contract.methods.symbol().call(),
});
```

You should be able to see the name and symbol of your Token, if you do not see your Address, click the `Portis Menu` button to authorize this Dapp.

#### Fueling the Smart Contract Transactions

1. Navigate to the [Ganache Faucet](https://pavelsinelnikov.duckdns.org/faucet)
2. Your address will be prefilled if you login to Portis, otherwise, paste your address
3. Click on the `Send Test Ether` button
4. Navigate to the Remix IDE

#### Sending Your Token

1. While on the Remix IDE, navigate to the "Deploy & run transactions" section
2. Copy the Address from one of the Accounts listed by clicking on the icon next to the Account dropdown menu
3. Navigate back to the Code Sandbox
4. Paste the Account Address in the Receiver field
5. You can set a different amount to be sent
6. Click the `Send Transfer` button
7. Accept the Transaction dialog from Portis
