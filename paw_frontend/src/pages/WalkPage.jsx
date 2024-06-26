import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import axios from 'axios'
import { Container, Row, Col } from 'react-bootstrap'
import MyStopwatch from '../components/MyStopwatch'


function WalkPage(props) {
    let { walkID } = useParams()
    const [walk, setWalk] = useState(null)
    const [end, setEnd] = useState(false)
    const [time, setTime] = useState(null)
    const [errorMessage, setErrorMessage] = useState("")


    const getWalkByID = async () => {
        let response = await axios.get(`/getwalk/${walkID}`)
        let check_walk = response && response.data
        setWalk(check_walk)
    }

    useEffect(() => {
        getWalkByID()
    }, [])



    return (
        <Container>
            <Row className='text-center'>
                <Col>
                    {walk && <div className='space'><h2>Pets: {walk.pets.map((pet) => (<span>{pet} </span>))}</h2>
                        <h4>Owner: {walk.owner}</h4>
                        <h4>Date: {walk.date}</h4>
                        <h4>Time: {walk.time}</h4>
                    </div>}
                </Col>
            </Row>
            <Row className='text-center'>
            <Col className='space'>
                    {walk && <MyStopwatch setTime={setTime} setEnd={setEnd} time={time} setErrorMessage={setErrorMessage} walkID={walkID} end={end} />}
                </Col>
            </Row>
            <Row>
                <Col></Col>
                <Col>
                </Col>
                <Col></Col>
            </Row>
            <Row className='pt-2 text-center'>
                <Col></Col>
                <Col>
                    <div id='messageDiv'>
                        {errorMessage}
                    </div>
                </Col>
                <Col></Col>
            </Row>
        </Container>
    )
}

export default WalkPage