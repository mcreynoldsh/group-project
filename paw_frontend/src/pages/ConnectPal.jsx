import { useEffect, useState } from "react"
import axios from "axios"
import { Container, Row, Col, Button } from 'react-bootstrap'
import ReactStars from 'react-stars'

function ConnectPal() {

    const [pals, setPals] = useState(null)

    const getPals = async () => {
        const response = await axios.get('/connectpal')
        if (response.data == 'no user') {
            window.location.assign("/login")
        }
        const pal_list = response.data && response.data.data
        console.log("pals", pal_list)
        for (let i = 0; i < pal_list.length; i++) {
            console.log(pal_list[i].bases[0])
        }
        setPals(pal_list)

    }
    useEffect(() => { getPals() }, [])

    return (
        <Container>
            <Row>
                <Col xs={0} md={2}></Col>
                <Col className="text-center" xs={12} md={8}>
                    {pals && pals.map((pal) => (
                        <div className="walk-div space text-center">
                            <img className="small-pic" src={`/media/users/profile-pic-${pal.key}.png`} alt="Profile Picture" />
                            <h5>{pal.first_name} {pal.last_name}</h5>
                            <ReactStars
                                count={5}
                                size={24}
                                edit={false}
                                color2={'#ffef5f'}
                                value={pal.avg_rating} 
                                className="centered-rating"/>
                            <p>({pal.avg_rating})</p>
                            <p>Bio: {pal.bio}</p>
                            <p>Rate: {pal.rate} per walk</p>
                            <p>Bases: </p>
                            {pal.bases.map((base) => (<p>{base}</p>))}
                            <Button variant="primary" href={`#/providers/${pal.key}`}>View {pal.first_name}'s Info</Button>
                        </div>
                    ))}
                </Col>
                <Col xs={0} md={2}></Col>
            </Row>
        </Container>
    )
}

export default ConnectPal