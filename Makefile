include .env

DEFAULT_ANVIL_KEY := 

build:
	forge build

deploy-sepolia: 
	forge script script/DeployRealEstateNFT.s.sol:DeployRealEstateNFT --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${API_KEY_ETHERSCAN} -vvvv

deploy-fork-sepolia: 
	forge script script/DeployRealEstateNFT.s.sol:DeployRealEstateNFT --fork-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --broadcast  -vvv
