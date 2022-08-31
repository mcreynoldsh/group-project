import { Container, Row, Col, Button, Card, Carousel } from 'react-bootstrap'
import { useEffect, useState } from "react";
import axios from 'axios';

function UserDashboard({ user, pets, bases }) {
    const [walker, setWalker] = useState(null)
    const [walks, setWalks] = useState(null)
    const [completedWalks, setCompletedWalks] = useState(null)

    const getWalker = async () => {
        const checkProvider = await axios.get('/provider/get')
        let checkWalker = checkProvider && checkProvider.data && checkProvider.data[0].fields
        if (checkWalker) {
            checkWalker['id'] = checkProvider.data[0].pk
        }
        setWalker(checkWalker)
    }

    const getPets = async (petIDs) => {
        let petArray = []
        for (let petID of petIDs) {
            let checkPet = await axios.get(`/pet/${petID}`)
            petArray.push(checkPet.data[0].fields)
        }
        return petArray
    }

    const getPetWalks = async () => {
        const response = await axios.get('/getpetwalks')
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

    const getCompletedWalks = async () => {
        const response = await axios.get('/getcompletedwalks')
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
        console.log(walkArray)
        setCompletedWalks(walkArray)
    }

    useEffect(() => {
        getWalker().then(getPetWalks()).then(getCompletedWalks)
    }, [])

    return (
        <Container fluid>
            <Row className='space'>
                <Col xs={12} md={4}>{user && <div className='text-center'><img className='profile-image' src={`/media/${user.profile_pic}`} alt="profile pic" />
                    <div><a href={`#/user/${user.id}/view`}>View Profile</a></div></div>}</Col>
                <Col xs={12} md={4}>
                    {user && <div className='text-center align-content-center'><h2 className="dash-header space">{user.first_name}'s Dashboard</h2></div>}
                </Col>
                <Col xs={12} md={4}></Col>
            </Row>
            <Row>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4 className="dash-header">Your Pets:</h4>
                    <hr />
                    {pets && pets.map((pet) => (<div className="mb-2"><img className='small-pet-pic' src={`/media/${pet.pet_pic}`} alt="pet pic" /><h5 className='mb-0'>{pet.name}</h5> <a href={`#/pet/${pet.id}/view`}>View Details</a></div>))}
                    <Button variant="primary" href='/#/addpet'>
                        Add Pet
                    </Button>
                </Col>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4 className="dash-header">Your Bases:</h4>
                    <hr />
                    {bases && bases.map((base) => (<h5>{base}</h5>))}
                    <Button variant="primary" href='/#/addbase'>
                        Connect A Base
                    </Button>
                </Col>
                <Col xs={12} md={4} className='text-center pt-5'>
                    <hr />
                    <h4 className="dash-header">Your Pet Pal:</h4>
                    <hr />
                    {walker && <div>
                        <img className='small-pic' src={`/media/${walker.profile_pic}`} alt="walker photo" />
                        <h5>{walker.first_name} {walker.last_name}</h5>
                    </div>}
                    {user && walker && <a className='new-line' href={`/#/chat/${walker.id}`}>Message</a>}
                    {walker && <a className='new-line' href='/#/schedulewalk'>Schedule Walk</a>}
                    {walker && <a className='new-line' href={`/#/review/${walker.id}`}>Leave Review</a>}
                    <Button variant="primary" href='/#/connectpal'>Connect A PetPal</Button>
                </Col>
            </Row>
            <Row>
                <Col xs={12} md={6} className='pt-5 text-center'>
                    <hr />
                    <h4 className="dash-header">Upcoming Walks:</h4>
                    <hr />
                    {walker && walks && walks.map((walk) => (<div className='walk-div text-center'><div className="same-line-div justify-content-center">{walk.pets.map((pet) => (<Card className="bg-dark text-white walk-pic'">
                        <Card.Img src={`media/${pet.pet_pic}`} alt="Pet image" />
                        <Card.ImgOverlay className='walk-pic-title'>
                            <Card.Title className='walk-pic-title'>{pet.name}</Card.Title>
                        </Card.ImgOverlay>
                    </Card>))}
                    </div>
                        <hr />
                        <p><strong>Date:</strong> {walk.date}</p>
                        <p><strong>Time:</strong> {walk.walk_time}</p>
                        <p><strong>With:</strong> {walker.first_name} {walker.last_name}</p>
                    </div>))}
                </Col>
                <Col xs={12} md={6} className='pt-5 text-center'>
                    <hr />
                    <h4 className="dash-header">Completed Walks:</h4>
                    <hr />
                    {completedWalks && completedWalks.map((walk) => (<div className='walk-div text-center'><div className="same-line-div justify-content-center">{walk.pets.map((pet) => (<Card className="bg-dark text-white walk-pic'">
                        <Card.Img src={`media/${pet.pet_pic}`} alt="Pet image" />
                        <Card.ImgOverlay className='walk-pic-title'>
                            <Card.Title className='walk-pic-title'>{pet.name}</Card.Title>
                        </Card.ImgOverlay>
                    </Card>))}
                    </div>
                        <hr />
                        <p><strong>Date:</strong> {walk.date}</p>
                        <p><strong>Time Walked (hrs:mins:secs):</strong> {walk.walk_time}</p>
                        <p><strong>With:</strong> {walker.first_name} {walker.last_name}</p>
                        <a href={`#/walk/${walk.id}/view`}>View Details</a>
                    </div>))}
                </Col>
            </Row>

        </Container>
    )
}

export default UserDashboard;