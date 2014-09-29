module constants

export ME, RE, G, MM, RM, MCM, DISTANCE_TO_MOON, MOON_PERIOD, MOON_INITIAL_ANGLE, ORIGIN
export TOTAL_DURATION, MARKER_TIME, TOLERANCE, INITIAL_POSITION, INITIAL_VELOCITY

const ME = 5.97e24 # mass of Earth in kg
const RE = 6.378e6 # radius of Earth in m (at equator)
const G = 6.67e-11 # gravitational constant
const MM = 7.35e22 # mass of moon in kg
const RM = 1.74e6 # radius of moon in m
const MCM = 5000. # mass of command module in kg
const DISTANCE_TO_MOON = 400.5e6 # in m (not really a constant)
const MOON_PERIOD = 27.3 * 24. * 3600. # in s
const MOON_INITIAL_ANGLE = pi / 180. * -61. # in radians
const ORIGIN = [0., 0.]

const TOTAL_DURATION = 12. * 24. * 3600. # in s
const MARKER_TIME = .5 * 3600. # in s (used in error correction)
const TOLERANCE = 100000. # in m (used in error correction)

const INITIAL_POSITION = [-6.701e6, 0.] # initial position for spacecraft in m
const INITIAL_VELOCITY = [0., -10.818e3] # initial velocity of spacecraft in m/s

end
