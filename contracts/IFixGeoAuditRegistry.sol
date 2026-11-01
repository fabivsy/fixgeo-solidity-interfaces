// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title IFixGeoAuditRegistry
 * @author Fabio Yocco (Lead Systems Architect, FixGEO Protocol)
 * @notice Public interface for autonomous AI agents and clients to verify on-chain audit status.
 * @dev Deployed on Ethereum Sepolia: 0x3b2Cd2c620976826F1C98CDdBb20C40AED6c0B6B
 */
interface IFixGeoAuditRegistry {
    struct AuditRecord {
        uint256 companyId;
        uint256 somScore;       // Scaled x10 (e.g. 765 = 76.5 / 100)
        uint256 timestamp;
        uint256 validUntil;     // 0 = Free baseline audit, >0 = Active $199/mo Protocol Seat
        string ipfsReportCID;
        string directoryTag;
    }

    /// @notice Check if a company has an active, valid RAG subscription heartbeat
    function isRAGActive(address companyAddress) external view returns (bool active, string memory ipfsCID);

    /// @notice Fetch the full audit record for a given company address
    function getAudit(address companyAddress) external view returns (AuditRecord memory);

    /// @notice Free baseline audit registration (Day 0 Purple Badge)
    function recordFreeAudit(
        uint256 companyId, 
        uint256 somScore, 
        string calldata ipfsCID, 
        string calldata directoryTag
    ) external;

    /// @notice Renew 30-day active protocol seat (Day 30 Green Shield)
    function renewMonthlySubscription(
        uint256 companyId, 
        uint256 somScore, 
        string calldata ipfsCID
    ) external payable;
}
