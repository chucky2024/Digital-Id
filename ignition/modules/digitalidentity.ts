import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const IdentityVerificationModule = buildModule("IdentityVerificationModule", (m) => {

    const digitalId = m.contract("IdentityVerification");

    return { digitalId };
});

export default IdentityVerificationModule;
//contract address = 