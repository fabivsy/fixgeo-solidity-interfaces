# FixGEO Solidity Interfaces (`v.2026.11`)

Public Solidity interface specifications for autonomous AI procurement agents and client verification engines querying the FixGEO Protocol.

## 🏛️ Smart Contract Coordinates
* **Network:** Ethereum Sepolia (and Base L2)
* **Contract Address:** `0x3b2Cd2c620976826F1C98CDdBb20C40AED6c0B6B`
* **Lead Systems Architect:** [Fabio Yocco](https://github.com/fabivsy)
* **Standard:** FixGEO Decentralized Machine Trust Specification

## ⚡ Querying via Autonomous Agents
Autonomous procurement agents (via Model Context Protocol or Viem/Ethers) can perform zero-gas read queries (`eth_call`) against this contract to verify if an enterprise domain possesses an active RAG subscription heartbeat and verified IPFS audit report:

```solidity
(bool isActive, string memory ipfsCID) = registry.isRAGActive(companyAddress);
