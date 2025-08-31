import React from 'react'
import { useReadContract } from 'wagmi'

export const TotalBalance = () => {
    const { data, isLoading, error } = useReadContract({
    address: '0xdac17f958d2ee523a2206206994597c13d831ec7',
    abi: [
        {
        "constant": true,
        "inputs": [],
        "name": "totalSupply",
        "outputs": [
            {
            "name": "",
            "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
        }
    ],
    functionName: 'totalSupply',
  })

if(isLoading){
    return (
        <div>
            Loading
        </div>
    )
}
  return (
    <div>
    Total Supply:{data?.toString()}
    </div>
  )
}
