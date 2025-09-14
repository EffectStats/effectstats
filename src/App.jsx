import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Nav from './Components/Nav'
import HeroSection from './Components/Hero_section'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <Nav />
      <HeroSection />
    </>
  )
}

export default App
