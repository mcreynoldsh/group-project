import React from 'react';
import { usePosition } from '../hooks/usePosition'

export const TrackWalker = () => {
  const watch = true;
  const {
    latitude,
    longitude,
    speed,
    timestamp,
    accuracy,
    heading,
    error,
  } = usePosition(watch, { enableHighAccuracy: true });

  return (
    <code>
      latitude: {latitude}<br/>
      longitude: {longitude}<br/>
      speed: {speed}<br/>
      timestamp: {timestamp}<br/>
      accuracy: {accuracy && `${accuracy} meters`}<br/>
      heading: {heading && `${heading} degrees`}<br/>
      error: {error}
    </code>
  );
};