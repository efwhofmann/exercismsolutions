orbital_periods = Dict(
    [("mercury", 0.2408467), 
     ("venus", 0.61519726), 
     ("earth", 1.0), 
     ("mars", 1.8808158),
     ("jupiter", 11.862615), 
     ("saturn", 29.447498), 
     ("uranus", 84.016846),
     ("neptune", 164.79132)])

function onEarth(seconds)
    age_onPlanet("earth", seconds)
end

function onMercury(seconds)
    age_onPlanet("mercury", seconds)
end

function onVenus(seconds)
    age_onPlanet("venus", seconds)
end

function onMars(seconds)
     age_onPlanet("mars", seconds)
end

function onJupiter(seconds)
     age_onPlanet("jupiter", seconds)
end

function onSaturn(seconds)
     age_onPlanet("saturn", seconds)
end

function onUranus(seconds)
     age_onPlanet("uranus", seconds)
end

function onNeptune(seconds)
     age_onPlanet("neptune", seconds)
end

function age_onPlanet(planet, seconds)
    earth_year = 31557600
    planet_orbit = orbital_periods[planet]
    round(seconds/(planet_orbit*earth_year); digits=2)
end