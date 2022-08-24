import { Container, Row, Col, Button } from 'react-bootstrap'
import { useEffect, useState } from "react";
import axios from 'axios';

function UserDashboard({ user, pets, bases }) {
    const [walker, setWalker] = useState(null)
    const [walks, setWalks] = useState(null)
    const [completedWalks, setCompletedWalks] = useState(null)

    const getWalker = async () => {
        const checkProvider = await axios.get('/provider/get')
        let checkWalker = checkProvider && checkProvider.data && checkProvider.data[0].fields
        if(checkWalker){
            checkWalker['id'] = checkProvider.data[0].pk
        }
        setWalker(checkWalker)
    }

    const getPetWalks = async () => {
        const checkWalks = await axios.get('/getpetwalks')
        let upcomingWalks = checkWalks && checkWalks.data
        setWalks(upcomingWalks)
    }

    const getCompletedWalks = async () => {
        const checkWalks = await axios.get('/getcompletedwalks')
        let completedWalks = checkWalks && checkWalks.data
        setCompletedWalks(completedWalks)
    }

    useEffect(() => {
        getWalker().then(getPetWalks()).then(getCompletedWalks)
    }, [])

    return (
        <Container>
            <Row className='space'>
                <Col>{user && <div className='text-center'><img className='profile-image' src={`/media/${user.profile_pic}`} alt="profile pic" />
                    <div><a href={`#/user/${user.id}/view`}>View Profile</a></div></div>}</Col>
                <Col>
                    {user && <div className='text-center align-content-center'><h2 className="dash-header space">{user.first_name}'s Dashboard</h2></div>}
                </Col>
                <Col></Col>
            </Row>
            <Row className='pt-5'>
                <Col className='text-center'><h4 className="dash-header">Your Pets:</h4>
                    <hr />
                    {pets && pets.map((pet) => (<div className="mb-2"><img className='small-pet-pic' src={`/media/${pet.pet_pic}`}  alt="pet pic" /><h5 className='mb-0'>{pet.name}</h5> <a href={`#/pet/${pet.id}/view`}>View Details</a></div>))}
                    <Button variant="primary" href='/#/addpet'>
                        Add Pet
                    </Button>
                </Col>
                <Col className='text-center'>
                    <h4 className="dash-header">Your Bases:</h4>
                    <hr />
                    {bases && bases.map((base) => (<h5>{base}</h5>))}
                    <Button variant="primary" href='/#/addbase'>
                        Connect A Base
                    </Button>
                </Col>
                <Col className='text-center'>
                    <h4 className="dash-header">Your Pet Pal:</h4>
                    <hr />
                    {walker &&  <div>
                                    <img className='small-pic' src={`/media/${walker.profile_pic}`} alt="walker photo" />
                                    <h5>{walker.first_name} {walker.last_name}</h5>
                                </div>}
                    {user && walker && <a className='new-line' href={`/#/chat/${walker.id}`}>Message</a>}
                    {walker && <a className='new-line' href='/#/schedulewalk'>Schedule Walk</a>}
                    <Button variant="primary" href='/#/connectpal'>Connect A PetPal</Button>
                </Col>
            </Row>
            <Row>
                <Col>
                    <hr />
                    <h4 className="dash-header">Upcoming Walks:</h4>
                    <hr />
                    {walker && walks && walks.map((walk) => (<div><h5>{walk.pets.map((pet) => (<span>{pet} </span>))}</h5>
                        <p>Date: {walk.date}</p>
                        <p>Time: {walk.time}</p>
                        <p>With {walker.first_name}</p>
                        <hr />
                    </div>))}
                </Col>
            </Row>
            <Row>
                <Col>
                    <h4 className="dash-header">Completed Walks:</h4>
                    <hr />
                    {completedWalks && completedWalks.map((walk) => (<div><h5>{walk.pets.map((pet) => (<span>{pet} </span>))}</h5>
                        <p>Date: {walk.date}</p>
                        <p>Time Walked (hrs:mins:secs): {walk.time}</p>
                        <p>With {walker.first_name}</p>
                        <a href={`#/walk/${walk.id}/view`}>View Details</a>
                        <hr />
                    </div>))}
                </Col>
            </Row>
        </Container>
    )
}

export default UserDashboard;