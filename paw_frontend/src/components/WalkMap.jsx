import { Fragment, useCallback, useRef, useState, useEffect } from "react";
import { GoogleMap, Polyline, useLoadScript } from "@react-google-maps/api";
import axios from "axios";

const WalkMap = (props) => {
    console.log('walk track', props.walkTrack)
  const polylineRef = useRef(null);
  const listenersRef = useRef([]);
  const [path, setPath] = useState(props.walkTrack);

  // Call setPath with new edited path
  const onEdit = useCallback(() => {
    if (polylineRef.current) {
      const nextPath = polylineRef.current
        .getPath()
        .getArray()
        .map((latLng) => latLng.toJSON());
      setPath(nextPath);
    }
  }, [setPath]);

  // Bind refs to current Polyline and listeners
  const onLoad = useCallback(
    (polyline) => {
      polylineRef.current = polyline;
      const path = polyline.getPath();
    //   listenersRef.current.push(
    //     path.addListener("set_at", onEdit),
    //     path.addListener("insert_at", onEdit),
    //     path.addListener("remove_at", onEdit)
    //   );
    },
    [onEdit]
  );

  // Clean up refs
  const onUnmount = useCallback(() => {
    listenersRef.current.forEach((lis) => lis.remove());
    polylineRef.current = null;
  }, []);

  const mapContainerStyle = {
    width: "100vh",
    height: "60vh",
  };
  
  const center = props.walkTrack[0];
  
//   const sharePath = () => {
//     console.log(path); //What should be here to show the edited path if its possible to access?
//     axios
//     .post("/mapupdate", { center: center, points: path })
//     .then((response) => {
//       console.log("update response: ", response);
//     });
//   };

  const { isLoaded, loadError } = useLoadScript({
    googleMapsApiKey: "AIzaSyDrxE9WPjC01VrUhpPXABzh_Kflxs1oo6E",
  });


  if (loadError) return "Error loading Google Map";
  if (!isLoaded) return "Loading Maps....";

  return (
    <Fragment>
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        zoom={10}
        center={center}
      >
        <Polyline
          ref={polylineRef}
          path={path}
          options={{ editable: true, strokeColor: "#ff0000" }}
          // Event used when manipulating and adding points
          onMouseUp={onEdit}
          onLoad={onLoad}
          onUnmount={onUnmount}
        />
      </GoogleMap>
      {/* <button onClick={sharePath}>Save path</button> */}
    </Fragment>
  );
};

export default WalkMap;