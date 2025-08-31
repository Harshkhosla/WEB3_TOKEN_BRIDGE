import React from 'react'
import { useAccount, useConnect, useDisconnect } from 'wagmi'

export const WalletConnector = () => {
  const { connectors, connect } = useConnect()
    const { address } = useAccount()
    const {disconnect} = useDisconnect()

    if(address){
        return (
            <div className=' flex justify-center space-x-2 align-middle'>
                <div className=' flex justify-center space-x-2 align-middle'>
                    you are already connected{address}
                </div>
               <div>
                <button  className="border-2 px-3 py-2 rounded-lg bg-amber-300 hover:cursor-pointer"onClick={()=>disconnect()}>Disconnect</button>
               </div>
                
            </div>
        )
    }
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
