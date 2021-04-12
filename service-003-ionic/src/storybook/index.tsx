import jsxRuntime from "react/jsx-runtime"
import { useEffect, createContext, useState } from "react"

export const useStorybookBundleUmd = () => {
  useEffect(() => {
    Object.defineProperty(window, "jsxRuntime", {
      value: jsxRuntime,
    })

    const head = document.getElementsByTagName("head")[0]

    const style = document.createElement("link")
    style.type = "text/css"
    style.rel = "stylesheet"
    style.href = "https://localhost:6007/storybook-bundle-umd.css"

    const script = document.createElement("script")
    script.async = true
    script.crossOrigin = ""
    script.src = "https://localhost:6007/storybook-bundle-umd.js"

    head.appendChild(style)
    head.appendChild(script)

    return () => {
      head.removeChild(style)
      head.removeChild(script)
    }
  }, [])
  return (window as any).Storybook
}

export const StoryBookContext = createContext<any>({})

export const StoryBookProvider = ({ children, components }: any) => {
  return (
    <StoryBookContext.Provider value={components}>
      {children}
    </StoryBookContext.Provider>
  )
}
