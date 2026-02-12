import styled from "styled-components";
import { Typography, Button, Card, Icon } from "@equinor/eds-core-react";
import { external_link } from "@equinor/eds-icons";
import {useEffect, useState} from "react";

const Wrapper = styled.div`
  width: 100%;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const Container = styled.main`
  max-width: 1024px;
`;

const App = () => {
  const [message, setMessage] = useState<string>('');

  useEffect(() => {
    (async () => {
      const fetchMessage = async () => {
          const response = await fetch("/api/hello");
          const asJson = await response.json();
          setMessage(asJson.message);
      };
      await fetchMessage();
    })();
  }, []);

  return (
    <Wrapper>
    <Container>
      <Card>
        <Card.Header>
          <Card.HeaderTitle>
            <Typography variant="h1">{message}</Typography>
          </Card.HeaderTitle>
        </Card.Header>
        <Card.Content>
          <Typography variant="body_short">
            This is a minimal starter template using Vite, React, TypeScript, and the
            Equinor Design System (EDS).
          </Typography>
        </Card.Content>
        <Card.Actions>
          <Button href="https://react.dev/">
            React documentation
            <Icon data={external_link}/>
          </Button>
          <Button href="https://eds.equinor.com">
            EDS documentation
            <Icon data={external_link}/>
          </Button>
        </Card.Actions>
      </Card>
    </Container>
  </Wrapper>
)};

export default App;
