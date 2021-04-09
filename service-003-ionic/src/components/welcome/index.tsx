import React, { useContext } from "react"

import Container from "./styled/Container"
import Card from "./styled/Card"
import Header from "./styled/Header"
import Content from "./styled/Content"
import { StoryBookContext } from "../../storybook"

interface IProps {
  className?: string
  header: string
  content: string
}

const Welcome = ({ className, header, content }: IProps) => {
  const [main, link] = content.split("##")

  const { Button } = useContext(StoryBookContext)

  return (
    <Container className={className}>
      <Card>
        <Header>{header}</Header>
        <Content>
          <div>{main}</div>
          <div>
            <a href={`mailto:${link}`}>{link}</a>
          </div>
        </Content>
        <Button
          label="Storybook Button"
          size="large"
          primary
          onClick={() => console.log("clicked")}
        />
      </Card>
    </Container>
  )
}

export default Welcome
