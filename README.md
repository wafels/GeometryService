# Solar System Geometry Service

RPC for geometry computations based on [SPICE](<https://naif.jpl.nasa.gov/naif/>) and [Spyne](<http://spyne.io/>). Returns either JSON or [MessagePack](<https://msgpack.org>) encoded responses.

## Functions

Several reference frames usual in heliophysics are known.

- `position` and `state` (in km and km/s) of `target` relative to `observer` in `ref` reference frame, optionally corrected for `abcorr`; representations (`kind`): `rectangular` (default), `latitudinal`, `radec`, `spherical`, `cylindrical`;

- `transform` -- transform between `from_ref` reference frame and `to_ref` reference frame; representations (`kind`): `matrix` (default), `angle` (Euler, rad), `quaternion`;

- `utc2scs` and `scs2utc` -- transform between UTC and spacecraft OBET (Solar Orbiter supported).

Other arguments:

- `utc` - start of time range
- `utc_end` (optional) - end of time range
- `deltat` (optional) - time step

## Example

`curl 'http://swhv.oma.be/position?utc=2014-04-12T20:23:35&utc_end=2014-04-13T19:44:11&deltat=21600&observer=SUN&target=STEREO%20Ahead&ref=HEEQ&kind=latitudinal'`

returns

`{"result": [{"2014-04-12T20:23:35.000": [143356392.01232576, 2.712634949777619, 0.12486990461569629]}, {"2014-04-13T02:23:35.000": [143359318.57914788, 2.7129759257313513, 0.12473463991365513]}, {"2014-04-13T08:23:35.000": [143362256.29411626, 2.7133174795109087, 0.12459673837570125]}, {"2014-04-13T14:23:35.000": [143365205.0945752, 2.713659603829239, 0.12445620339056596]}]}`

## Installation

A sample Dockerfile is provided. In the default configuration it runs on port 7789.
