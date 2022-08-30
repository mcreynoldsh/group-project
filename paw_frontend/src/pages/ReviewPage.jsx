import React from 'react'
import { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Container, Row, Col, Button, Form } from 'react-bootstrap'
import axios from 'axios'
import ReactStars from 'react-stars'


function ReviewPage({ getUserById }) {
    let { userID } = useParams()
    const [provider, setProvider] = useState(null)
    const [rating, setRating] = useState(null)
    const [errorMessage, setErrorMessage] = useState("")
    let navigate = useNavigate()

    const getProvider = async () => {
        const check_provider = await getUserById(userID)
        console.log(check_provider)
        setProvider(check_provider)
    }

    const handleSubmit = async (event) => {
        event.preventDefault()
        const comment = event.target[0].value
        if(rating == null){
            setErrorMessage("Must select a Rating!")
            return
        }
        const response = await axios.post('/providers/review', { provider: provider,
                                                                 rating: rating,
                                                                 comment: comment})
        if (response.data == 'success') {
            navigate("/", { replace: true })
            window.location.reload()
        }
        else {
            setErrorMessage(response.data)
        }

    }
    const ratingChanged = (newRating) => {
        setRating(newRating)
      }

    useEffect(() => {
        getProvider()
    }, [])

    return (
        <Container>
            <Row>
                <Col>
                    {provider &&<div className='pt-3 text-center'> <h3>New Review for: </h3>
                    <img className='small-pic' src={`/media/${provider.profile_pic}`} alt="Profile Picture" /> <h5>{provider.first_name} {provider.last_name}</h5></div> }
                </Col>
            </Row>
            <Row className='pt-2 justify-content-center'>
                <Col>
                    <p>Select Rating: </p>
                    <ReactStars
                        count={5}
                        onChange={ratingChanged}
                        size={24}
                        color2={'#ffd700'}
                        value = {rating} />
                    <Form className="pt-2" onSubmit={handleSubmit}>
                        <Form.Group className="mb-3" controlId="formComment">
                            <Form.Label>Comments:</Form.Label>
                            <Form.Control as="textarea" rows={3} />
                        </Form.Group>
                        <Button className="m-2" variant="primary" type="submit">
                            Submit Review
                        </Button>
                    </Form>
                </Col>
            </Row>
            <Row className='pt-2'>
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

export default ReviewPage