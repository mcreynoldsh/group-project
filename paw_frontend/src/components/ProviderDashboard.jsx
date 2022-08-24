import axios from 'axios';
import { useEffect, useState } from 'react';
import { Container, Row, Col, Form, Button } from 'react-bootstrap'
import CurrentWeather from './CurrentWeather';

function ProviderDashboard({ user, bases }) {
    const [connections, setConnections] = useState(null)
    const [walks, setWalks] = useState(null)

    const getConnections = async () => {
        const response = await axios.get('/checkconnections')
        let connectArray = []
        if(response.data[0]){
            for (let i = 0; i < response.data.length; i++) {
                let connect = response.data[i].fields
                connect["id"] = response.data[i].pk
                connectArray.push(connect)
              }
        }
        else{
            connectArray = null
        }
        setConnections(connectArray)
    }

    const getProviderWalks = async () => {
        const checkWalks = await axios.get('/getproviderwalks')
        let upcomingWalks = checkWalks && checkWalks.data
        setWalks(upcomingWalks)
    }

    useEffect(() => {
        getConnections().then(getProviderWalks())
    }, [])
    return (
        <Container>
            <Row className='space'>
                <Col>{user && <div className='text-center'><img className='profile-image' src={`/media/${user.profile_pic}`} alt="profile pic" />
                                    <div><a href={`#/user/${user.id}/view`}>View Profile</a></div></div>}</Col>
                <Col>
                    {user && <div className='text-center'><h2 className="dash-header">{user.first_name}'s Dashboard</h2></div>}
                </Col>
                <Col>
                    {user && <CurrentWeather user={user} />}
                </Col>
            </Row>
            <Row className='space'>
                <Col>
                    <h4>Upcoming Walks:</h4>
                    <hr />
                    {walks && walks.map((walk) => (<div><h5>{walk.pets.map((pet) => (<span>{pet} </span>))}</h5>
                        <p>Date: {walk.date}</p>
                        <p>Time: {walk.time}</p>
                        <Button href={`/#/walk/${walk.id}`} variant="outline-primary" size='sm'>Begin Walk</Button>
                        <hr />
                    </div>))}
                </Col>
                <Col>
                    <h4>Your Bases:</h4>
                    <hr />
                    {bases && bases.map((base) => (<h5>{base}</h5>))}
                    <Button variant="primary" href='/#/addbase'>
                        Connect A Base
                    </Button>
                </Col>
                <Col>
                    <h4>Your Connections:</h4>
                    <hr />
                    {connections && connections.map((connection) => (<div><h5>{connection.first_name} {connection.last_name}</h5> <p>Email: {connection.email}</p> <p>Address: {connection.address}</p> <a className='new-line' href={`/#/chat/${connection.id}`}>Message</a> <hr /> </div>))}
                </Col>
            </Row>
        </Container>
    )
}

export default ProviderDashboard;