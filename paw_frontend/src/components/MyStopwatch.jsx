import React from 'react';
import { useStopwatch } from 'react-timer-hook';
import { Button } from 'react-bootstrap'
import { TrackWalker } from './TrackWalker';
import { useState, useEffect } from 'react';
import { usePosition } from '../hooks/usePosition';
import WalkForm from '../components/WalkForm';

function MyStopwatch(props) {
  const {
    seconds,
    minutes,
    hours,
    isRunning,
    start,
    pause,
  } = useStopwatch({ autoStart: false });

  const [tracks, setTracks] = useState([])
  const [startTracking, setStartTracking] = useState(false)
  const [walkTracks, setWalkTracks] = useState({});

  const watch = false;
  const {
    latitude,
    longitude,
    speed,
    timestamp,
    accuracy,
    heading,
    error,
    toggleWatch,
  } = usePosition(watch, { enableHighAccuracy: true });

  useEffect(() => {
    if(tracks.length < 1) {
      setTracks([{"lat": latitude, "lng": longitude}])
    }else {
      setTracks( (currentTrack) => {
        console.log(`currentTrack-1: `, currentTrack);
        // remove first track that loads as undefined
        if(tracks[0].lat === undefined) {
          setTracks( (currentTrack) => {
            currentTrack.shift()
            return currentTrack
          })
        }
        return [...currentTrack, {"lat": latitude, "lng":longitude}]
      })
    }
    console.log(latitude, longitude)
    // const walkTracks = tracks
  }, [latitude, longitude])

  const endWalk = (event) => {
    event.preventDefault();
    pause();
    props.setTime(`${hours}:${minutes}:${seconds}`);
    props.setEnd(true);
    setTracks( (currentTrack) => {
      // remove inital coords recorded when page loads and before begin button clicked
      tracks.shift();
        return [...currentTrack]
    });
    toggleWatch(false);
    console.log('tracks: ');
    console.log(tracks);
    
  }

  const beginWalk = (event) => {
    event.preventDefault();
    start();
    setStartTracking(true);
    toggleWatch(true);
    props.setEnd(false);
  }

  return (
    <div style={{ textAlign: 'center' }}>
      <h5>Walk Timer:</h5>
      <p>hrs:mins:secs</p>
      <div style={{ fontSize: '100px' }}>
        <span>{hours}</span>:<span>{minutes}</span>:<span>{seconds}</span>
      </div>
      <p>{isRunning ? 'Walking' : 'Walking Paused'}</p>
      <Button variant='primary' size='sm' onClick={beginWalk}>Begin Walk</Button>
      <Button className="m-1" variant='secondary' size='sm' onClick={pause}>Pause Walk</Button>
      <Button variant='danger' size='sm' onClick={endWalk}>End Walk</Button>
      <div>
        <h3>latitude: {latitude}, longitude: {longitude}</h3>
      </div>
      <div>
        {props.end && <WalkForm time={props.time} setErrorMessage={props.setErrorMessage} walkID={props.walkID} tracks={tracks} />}
      </div>
    </div>
  );
}

export default MyStopwatch;