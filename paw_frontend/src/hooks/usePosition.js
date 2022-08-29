// from https://github.com/trekhleb/use-position/blob/master/src/usePosition.js
// 'npm install use-position' failed

import {useState, useEffect} from 'react';

const defaultSettings = {
  enableHighAccuracy: false,
  timeout: Infinity,
  maximumAge: 0,
};

export const usePosition = (watch = false, userSettings = {}) => {
  const settings = {
    ...defaultSettings,
    ...userSettings,
  };

  const [position, setPosition] = useState({});
  const [error, setError] = useState(null);
  const [isWatchOn, setIsWatchOn] = useState(watch)

  const onChange = ({coords, timestamp}) => {
    setPosition({
      latitude: coords.latitude,
      longitude: coords.longitude,
      accuracy: coords.accuracy,
      speed: coords.speed,
      heading: coords.heading,
      timestamp,
    });
  };

  const onError = (error) => {
    setError(error.message);
  };

  const toggleWatch = (start) => {
     watch = start;
     setIsWatchOn(start)
     console.log(start)
  }

  useEffect(() => {
    if (!navigator || !navigator.geolocation) {
      setError('Geolocation is not supported');
      return;
    }
    console.log("useEffect", isWatchOn)
    if (isWatchOn) {
      const watcher =
        navigator.geolocation.watchPosition(onChange, onError, settings);
      return () => navigator.geolocation.clearWatch(watcher);
    }

    navigator.geolocation.getCurrentPosition(onChange, onError, settings);
  }, [
    settings.enableHighAccuracy,
    settings.timeout,
    settings.maximumAge,
    isWatchOn,
  ]);

  return {...position, error, toggleWatch};
};