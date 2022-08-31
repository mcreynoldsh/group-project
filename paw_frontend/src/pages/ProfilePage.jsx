import React from 'react'
import { useState, useEffect } from 'react'
import { Container, Row, Col } from 'react-bootstrap'
import { useParams } from 'react-router-dom'
import ReactStars from 'react-stars'
import axios from 'axios'

function ProfilePage(props) {
    let { userID } = useParams()
    const [reviews, setReviews] = useState(null)

    const getReviews = async () => {
        const response = await axios.get(`/reviews/${userID}`)
        const checkReviews = response && response.data
        if(checkReviews[0]){
            const revArray = []
            for(let review of checkReviews){
                const user = await props.getUserById(review.fields.rater)
                revArray.push({"comment":review.fields.comment, "date":review.fields.date, "star_rating": review.fields.star_rating, "user":user})
            }
            setReviews(revArray)
        }
    }
    useEffect(()=>{
        getReviews()
    },[])
    return (
        <Container>
            <Row>
                <Col xs={12} md={4}>
                    {props.user && <div>
                        <div><img className='profile-image space' src={`/media/${props.user.profile_pic}`} alt="profile pic" /></div>
                        <a href="#/profilepic/upload">Add/Replace Profile Picture</a></div>}
                    {props.user && props.user.is_provider && <div>
                                                                <p className='pt-2'>Average Rating: </p>
                                                                <ReactStars
                                                                    count={5}
                                                                    size={24}
                                                                    edit= {false}
                                                                    color2={'#ffd700'}
                                                                    value = {props.user.avg_rating}
                                                                    className="outlined-rating" />
                                                                    <p>({props.user.avg_rating})</p>
                                                            </div>}
                </Col>
                <Col xs={12} md={4} className="space">
                    <hr />
                    <h4>User Profile:</h4>
                    <hr />
                    {props.user && <div>
                        <p><strong>Name:</strong> {props.user.first_name} {props.user.last_name}</p>
                        <p><strong>Email:</strong> {props.user.email}</p>
                        <p><strong>Address:</strong> {props.user.address}</p>
                        <p><strong>Zip Code:</strong> {props.user.zip_code}</p>
                        <p><strong>Bio:</strong> {props.user.bio}</p>
                        {props.user.is_provider && <p><strong>Rate:</strong> {props.user.rate} per walk</p>}
                        <hr />
                        <a href={`#/user/${props.user.id}/edit`}>Edit Profile</a>
                    </div>}
                </Col>
                <Col xs={12} md={4} className="space">
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
            <a href="/">Go back</a>
        </Container>
    )
}

export default ProfilePage