import React, { useState } from 'react'
import { Container, Row, Col, Form, Button } from 'react-bootstrap'
import axios from 'axios'
import { useNavigate } from 'react-router-dom'

function UploadProfilePic() {
    const [file, setFile] = useState(null)
    const [errorMessage, setErrorMessage] = useState(null)
    const navigate = useNavigate()

    function handleChange(e) {
        e.preventDefault()
        setFile(e.target.files[0])
    }

    function handleSubmit(e) {
        e.preventDefault()
        const formData = new FormData()
        if (file) {
            formData.append("file", file)
            axios.post('/profilepic/upload', formData).then((response) => {
                if (response.data == 'success') {
                    navigate('/', { replace: true })
                }
                else {
                    setErrorMessage(response.data)
                }
            })
        }
    }
    return (
        <Container>
            <Row className='space'>
                <Col></Col>
                <Col>

                    <Form.Group controlId="formFile" className="mb-3">
                        <Form.Label>Select Profile Picture</Form.Label>
                        <Form.Control type="file" onChange={handleChange} />
                    </Form.Group>
                    <Button type='submit' className='btn-primary' onClick={handleSubmit}>Upload</Button>

                </Col>
                <Col></Col>
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

export default UploadProfilePic