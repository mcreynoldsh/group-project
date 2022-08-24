import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import axios from 'axios'
import { Container, Row, Col } from 'react-bootstrap'

function PetDetail() {
    let { petID } = useParams()
    const [pet, setPet] = useState(null)

    const getPetByID = async () => {
        let response = await axios.get(`/pet/${petID}`)
        let check_pet = response && response.data
        setPet(check_pet[0].fields)
    }

    useEffect(() => {
        getPetByID()
    }, [])

    return (
        <Container>
            <Row>
                <Col>{pet && <div><div className='space'><img className='pet-profile-image' src={`/media/${pet.pet_pic}`} alt="pet pic" /></div>
                        <div><a href={`#/petpic/upload/${petID}`}>Add/Replace Pet Picture</a></div></div>}</Col>
                <Col className="space">
                    <h4>Pet Detail:</h4>
                    <hr />
                    {pet && <div><h5>Name: {pet.name}</h5>
                        <p>Species: {pet.species}</p>
                        <p>Weight: {pet.weight}</p>
                        <p>Age: {pet.age}</p>
                        <hr />
                        <a href={`#/pet/${petID}/edit`}>Edit Details</a>
                    </div>}
                </Col>
                <Col></Col>
            </Row>
            <a href="/">Go back</a>
        </Container>
    )
}

export default PetDetail