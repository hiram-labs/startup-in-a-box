import React from "react"

import Container from "./styled/Container"
import Card from "./styled/Card"
import Header from "./styled/Header"
import Content from "./styled/Content"
import Button from "./styled/Button"

interface IProps {
  className?: string
  header: string
  content: string
}

const Welcome = ({ className, header, content }: IProps) => {
  const [main, link] = content.split("##")

  return (
    <Container className={className}>
      <Card>
        <Header>{header}</Header>
        <Content>
          <div>{main}</div>
          <div>
            <a href={`mailto:${link}`}>{link}</a>
          </div>
          <Button
            label="Storybook Example"
            onClick={() => {
              alert(
                "Storybook used in creating and exporting this button component. Read more in docs."
              )
            }}
            primary
            size="medium"
          />
        </Content>
      </Card>
    </Container>
  )
}

export default Welcome
