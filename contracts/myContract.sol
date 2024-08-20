// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BloggingPlatform {

    struct Post {
        string title;
        string body;
        bool published;
    }

    struct Member {
        string name;
        bool exists;
    }

    mapping(address => Member) private members;
    mapping(address => Post) private posts;

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function signUp(string memory name, address userAddress) public returns (string memory) {
        assert(!members[userAddress].exists);

        members[userAddress] = Member({
            name: name,
            exists: true
        });

        return string(abi.encodePacked(name, " has joined the platform"));
    }

    function writePost(string memory title, string memory body, address userAddress) public {
        assert(members[userAddress].exists);

        posts[userAddress] = Post({
            title: title,
            body: body,
            published: true
        });
    }

    function readPost(address userAddress) public view returns (Post memory) {
        assert(posts[userAddress].published);

        return posts[userAddress];
    }

    function deletePost(address userAddress, address requester) public {
        require(owner == requester, "Unauthorized action");
        assert(posts[userAddress].published);

        delete posts[userAddress];
    }
}
