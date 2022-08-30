import React from 'react'
import { Container, Row, Col } from 'react-bootstrap'
import ReactStars from 'react-stars'

function ProfilePage(props) {

    return (
        <Container>
            <Row>
                <Col>
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
                <Col className="space">
                    <h4>User Profile:</h4>
                    <hr />
                    {props.user && <div>
                        <p>Name: {props.user.first_name} {props.user.last_name}</p>
                        <p>Email: {props.user.email}</p>
                        <p>Address: {props.user.address}</p>
                        <p>Zip Code: {props.user.zip_code}</p>
                        <p>Bio: {props.user.bio}</p>
                        {props.user.is_provider && <p>Rate: {props.user.rate} per walk</p>}
                        <hr />
                        <a href={`#/user/${props.user.id}/edit`}>Edit Profile</a>
                    </div>}
                </Col>
                <Col></Col>
            </Row>
            <a href="/">Go back</a>
        </Container>
    )
}

export default ProfilePage