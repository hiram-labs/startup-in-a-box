import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react"

import Welcome from "../../components/welcome"

const Landing: React.FC = () => {
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Landing Page</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Landing Page</IonTitle>
          </IonToolbar>
        </IonHeader>
        <Welcome
          header="Chalk"
          content={
            "Production and Deployment Ready boilerplate ##adjeibohyen@hotmail.co.uk"
          }
        />
      </IonContent>
    </IonPage>
  )
}

export default Landing
