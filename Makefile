include .env

DEFAULT_ANVIL_KEY := 

build:
	forge build

deploy-sepolia: 
	forge script script/DeployRealEstateNFT.s.sol:DeployRealEstateNFT --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${API_KEY_ETHERSCAN} -vvvv

deploy-fork-sepolia: 
	forge script script/DeployRealEstateNFT.s.sol:DeployRealEstateNFT --fork-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast  -vvv

deploy-neon-devnet: 
	forge script script/DeployRealEstateNFT.s.sol:DeployRealEstateNFT --rpc-url ${NEON_EVM_RPC_URL_DEVNET} --private-key ${PRIVATE_KEY} --legacy --broadcast  --skip-simulation -vvv

verification-neon-devnet :
	forge verify-contract --chain-id ${NEON_EVM_CHAIN_ID_DEVNET} ${REAL_ESTATE_CONTRACT_ADDRESS_TO_VERIFY} src/RealEstateNFT.sol:RealEstateNFT --verifier-url ${NEON_EVM_VERIFIER_URL_BLOCKSCOUT} --verifier blockscout