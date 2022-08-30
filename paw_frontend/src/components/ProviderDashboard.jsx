import axios from 'axios';
import { useEffect, useState } from 'react';
import { Container, Row, Col, Button, Card } from 'react-bootstrap'
import CurrentWeather from './CurrentWeather';

function ProviderDashboard({ user, bases }) {
    const [connections, setConnections] = useState(null)
    const [walks, setWalks] = useState(null)

    const getConnections = async () => {
        const response = await axios.get('/checkconnections')
        let connectArray = []
        if (response.data[0]) {
            for (let i = 0; i < response.data.length; i++) {
                let connect = response.data[i].fields
                connect["id"] = response.data[i].pk
                connectArray.push(connect)
            }
        }
        else {
            connectArray = null
        }
        setConnections(connectArray)
    }

    const getPets = async (petIDs) => {
        let petArray = []
        for (let petID of petIDs) {
            let checkPet = await axios.get(`/pet/${petID}`)
            petArray.push(checkPet.data[0].fields)
        }
        return petArray
    }

    const getProviderWalks = async () => {
        const response = await axios.get('/getproviderwalks')
        let walkArray = []

        if (response.data[0]) {
            for (let i = 0; i < response.data.length; i++) {
                let checkWalk = response.data[i].fields
                checkWalk["id"] = response.data[i].pk
                checkWalk["pets"] = await getPets(checkWalk["pets"])
                walkArray.push(checkWalk)
            }
        }
        else {
            walkArray = null
        }
        setWalks(walkArray)
    }

    useEffect(() => {
        getConnections().then(getProviderWalks())
    }, [])
    return (
        <Container fluid>
            <Row className='space'>
                <Col xs={12} md={4}>{user && <div className='text-center'><img className='profile-image' src={`/media/${user.profile_pic}`} alt="profile pic" />
                    <div><a href={`#/user/${user.id}/view`}>View Profile</a></div></div>}</Col>
                <Col xs={12} md={4}>
                {user && <div className='text-center align-content-center'><h2 className="dash-header pt-2">{user.first_name}'s Dashboard</h2></div>}
                </Col>
                <Col xs={12} md={4} className="pt-1">
                    {user && <CurrentWeather user={user} />}
                </Col>
            </Row>
            <Row>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4>Upcoming Walks:</h4>
                    <hr />
                    {walks && walks.map((walk) => (<div className='walk-div text-center'><div className="same-line-div justify-content-center">{walk.pets.map((pet) => (<Card className="bg-dark text-white walk-pic'">
                        <Card.Img src={`media/${pet.pet_pic}`} alt="Pet image" />
                        <Card.ImgOverlay className='walk-pic-title'>
                            <Card.Title className='walk-pic-title'>{pet.name}</Card.Title>
                        </Card.ImgOverlay>
                    </Card>))}
                    </div>
                        <hr />
                        <p><strong>Date:</strong> {walk.date}</p>
                        <p><strong>Time:</strong> {walk.walk_time}</p>
                        <Button href={`/#/walk/${walk.id}`} variant="outline-primary" size='sm'>Begin Walk</Button>
                    </div>))}
                </Col>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4>Your Bases:</h4>
                    <hr />
                    <div className='text-center'>
                        {bases && bases.map((base) => (<h5>{base}</h5>))}
                        <Button variant="primary" href='/#/addbase'>
                            Connect A Base
                        </Button>
                    </div>
                </Col>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4>Your Connections:</h4>
                    <hr />
                    {connections && connections.map((connection) => (<div className='text-center'><img className='small-pic' src={`/media/${connection.profile_pic}`} alt="profile picture" /><h5>{connection.first_name} {connection.last_name}</h5> <p><strong>Email:</strong> {connection.email}</p> <p><strong>Address:</strong> {connection.address}</p> <a className='new-line' href={`/#/chat/${connection.id}`}>Message</a> <hr /> </div>))}
                </Col>
            </Row>
        </Container>
    )
}

export default ProviderDashboard;