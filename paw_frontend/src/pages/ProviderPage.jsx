import React from 'react'
import { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Container, Row, Col, Button } from 'react-bootstrap'
import axios from 'axios'
import ReactStars from 'react-stars'

function ProviderPage({ getUserById }) {
    let { userID } = useParams()
    const [provider, setProvider] = useState(null)
    const [reviews, setReviews] = useState(null)
    let navigate = useNavigate()

    const getProvider = async () => {
        const check_provider = await getUserById(userID)
        const response = await axios.get(`/reviews/${userID}`)
        const checkReviews = response && response.data
        setProvider(check_provider)
        if(checkReviews[0]){
            const revArray = []
            for(let review of checkReviews){
                const user = await getUserById(review.fields.rater)
                revArray.push({"comment":review.fields.comment, "date":review.fields.date, "star_rating": review.fields.star_rating, "user":user})
            }
            setReviews(revArray)
            console.log(reviews)
        }
    }

    const connectProvider = async (event) => {
        event.preventDefault()
        const response = await axios.put('/providers/connect', { provider: provider })
        if (response.data == 'okay') {
            navigate("/", { replace: true })
            window.location.reload()
        }
        else {
            console.log("Error Occurred")
        }

    }

    useEffect(() => {
        getProvider()
    }, [])

    return (
        <Container>
            <Row className='pt-5 justify-content-center'>

                <Col md={6} xs={12}>
                    {provider && <div>
                        <img className = "profile-image" src={`/media/${provider.profile_pic}`} alt="Profile Picture" />
                        <h3>{provider.first_name} {provider.last_name}</h3>
                        <ReactStars
                                count={5}
                                size={24}
                                edit={false}
                                color2={'#ffef5f'}
                                value={provider.avg_rating} 
                                className="same-line-rating"/>
                                <span>({provider.avg_rating})</span>
                        <p><strong>Email:</strong> {provider.email}</p>
                        <p><strong>Bases:</strong> {provider.bases.map((base)=>(base[1]+ ", "))}</p>
                        <p><strong>Rate:</strong> {provider.rate} per walk</p>
                        <p><strong>Bio:</strong> {provider.bio}</p></div>}
                    <Button vriant="primary" onClick={connectProvider}>Connect</Button>
                </Col>
                <Col md={6} xs={12}>
                    <hr />
                    <h4>Recent Reviews: </h4>
                    <hr />
                    {reviews && reviews.map((review)=>(<div className='walk-div text-center'>
                        <img className='small-pic' src={`media/${review.user.profile_pic}`} alt="Profile Pic" />
                        <h5>{review.user.first_name}</h5>
                        <p>{review.date}</p>
                        <ReactStars
                                count={5}
                                size={24}
                                edit={false}
                                color2={'#ffef5f'}
                                value={review.star_rating} 
                                className="same-line-rating"/>
                        <p>"{review.comment}"</p>
                    </div>))}
                </Col>
            </Row>
        </Container>
    )
}

export default ProviderPage