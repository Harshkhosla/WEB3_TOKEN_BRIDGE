import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { WagmiProvider } from 'wagmi'
import { config } from './config'
import './App.css'
import { WalletConnector } from './components/WalletConnctor'
const queryClient = new QueryClient()

function App() {

  return (
    <>
     <WagmiProvider config={config}>
      <QueryClientProvider client={queryClient}>
            <div>
              <WalletConnector/>
            </div>
      </QueryClientProvider>
    </WagmiProvider>
    </>
  )
}

export default App
