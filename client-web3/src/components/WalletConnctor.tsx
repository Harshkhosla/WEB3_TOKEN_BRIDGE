import React from 'react'
import { useConnect } from 'wagmi'

export const WalletConnector = () => {
  const { connectors, connect } = useConnect()

  return (
    <div>
      {connectors.map((data, ind) => (
        <div key={ind} className="flex items-center gap-2 cursor-pointer" onClick={() => connect({ connector: data })}>
          {data.icon && (
            <img 
              src={data.icon} 
              alt={data.name} 
              width={32} 
              height={32} 
              style={{ borderRadius: '8px' }} 
            />
          )}
          <span>{data.name}</span>
        </div>
      ))}
    </div>
  )
}
