import React from "react"
import ReactDOM from "react-dom"
import "./index.css"
import App from "./components/App"
import ShopDataProvider from "./providers/ShopDataProvider"
import { isEnvBrowser } from "./utils/misc"
import LocaleProvider from "./providers/LocaleProvider"

if (isEnvBrowser()) {
  const root = document.getElementById("root")

  // https://i.imgur.com/iPTAdYV.png - Night time img
  root!.style.backgroundImage = 'url("https://i.imgur.com/3pzRj9n.png")'
  root!.style.backgroundSize = "cover"
  root!.style.backgroundRepeat = "no-repeat"
  root!.style.backgroundPosition = "center"
}
ReactDOM.render(
  <React.StrictMode>
    <LocaleProvider>
      <ShopDataProvider>
        <App />
      </ShopDataProvider>
    </LocaleProvider>
  </React.StrictMode>,
  document.getElementById("root")
)
