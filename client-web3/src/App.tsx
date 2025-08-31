import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { WagmiProvider } from 'wagmi'
import { config } from './config'
import './App.css'
import { WalletConnector } from './components/WalletConnctor'
import { TotalBalance } from './components/TotalBalance'
import { AllowUSDT } from './components/AllowUsdt'
const queryClient = new QueryClient()

function App() {

  return (
    <>
     <WagmiProvider config={config}>
      <QueryClientProvider client={queryClient}>
            <div>
              <WalletConnector/>
              <TotalBalance/>
              <AllowUSDT/>
            </div>
      </QueryClientProvider>
    </WagmiProvider>
    </>
  )
}

export default App
