import React from 'react'
import {useEffect} from 'react'

function Temp(props) {

    useEffect(() => {
      console.log(props.walkTrack)
    }, [])
    

  return (
    <div> 
        {/* <h1>{props.walkTrack}</h1> */}
    </div>
  )
}

export default Temp