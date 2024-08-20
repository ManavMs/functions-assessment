# BloggingPlatform Smart Contract

This is the `BloggingPlatform` smart contract, a simple decentralized blogging platform built on the Ethereum blockchain. Users can sign up, create posts, read posts, and the contract owner can delete posts.

## Features

- **Sign Up:** Users can register themselves with a username.
- **Write Post:** Registered users can create and publish posts.
- **Read Post:** Anyone can read a published post from a user.
- **Delete Post:** The contract owner can delete any post.

## Contract Overview

### Structures

- **Post**
  - `string title`: The title of the post.
  - `string body`: The content of the post.
  - `bool published`: A flag indicating whether the post is published.

- **Member**
  - `string name`: The username of the registered user.
  - `bool exists`: A flag indicating whether the user is registered.

### Mappings

- `mapping(address => Member) private members`: A mapping of Ethereum addresses to `Member` structs.
- `mapping(address => Post) private posts`: A mapping of Ethereum addresses to `Post` structs.

### Variables

- `address private owner`: The address of the contract owner (admin).

## Functions

### `constructor()`

Sets the contract deployer as the owner of the contract.

### `signUp(string memory name, address userAddress) public returns (string memory)`

Registers a new user with the provided `name` and `userAddress`.

- **Parameters:**
  - `name`: The username of the user.
  - `userAddress`: The Ethereum address of the user.

- **Returns:**
  - A string message confirming the registration.

### `writePost(string memory title, string memory body, address userAddress) public`

Allows a registered user to create and publish a new post.

- **Parameters:**
  - `title`: The title of the post.
  - `body`: The content of the post.
  - `userAddress`: The Ethereum address of the user.

### `readPost(address userAddress) public view returns (Post memory)`

Allows anyone to read a published post from a specific user.

- **Parameters:**
  - `userAddress`: The Ethereum address of the user.

- **Returns:**
  - The `Post` struct containing the title, body, and publication status.

### `deletePost(address userAddress, address requester) public`

Allows the contract owner to delete a post from a specific user.

- **Parameters:**
  - `userAddress`: The Ethereum address of the user whose post is to be deleted.
  - `requester`: The address requesting the deletion. Must be the contract owner.

## Usage

1. **Deploy the contract** to the Ethereum blockchain.
2. **Register users** by calling the `signUp` function.
3. **Create posts** using the `writePost` function after registering.
4. **Read posts** with the `readPost` function by providing the user's address.
5. **Delete posts** using the `deletePost` function, which can only be called by the contract owner.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
