const ORBITAL_EART = (365.25 * 24 * 60 * 60);

const ORBITAL_MERC = ORBITAL_EART * 0.2408467;
const ORBITAL_VENU = ORBITAL_EART * 0.61519726;
const ORBITAL_MARS = ORBITAL_EART * 1.8808158;
const ORBITAL_JUPI = ORBITAL_EART * 11.862615;
const ORBITAL_SATU = ORBITAL_EART * 29.447498;
const ORBITAL_URAN = ORBITAL_EART * 84.016846;
const ORBITAL_NEPT = ORBITAL_EART * 164.79132;

const spaceAge = x => y => Number((y / x).toFixed(2));

export default class SpaceAge {

  constructor(seconds) { this.seconds = seconds; }
     _spaceAge(period) { return spaceAge(period)(this.seconds); }

    onEarth() { return this._spaceAge(ORBITAL_EART); }
  onMercury() { return this._spaceAge(ORBITAL_MERC); }
    onVenus() { return this._spaceAge(ORBITAL_VENU); }
     onMars() { return this._spaceAge(ORBITAL_MARS); }
  onJupiter() { return this._spaceAge(ORBITAL_JUPI); }
   onSaturn() { return this._spaceAge(ORBITAL_SATU); }
   onUranus() { return this._spaceAge(ORBITAL_URAN); }
  onNeptune() { return this._spaceAge(ORBITAL_NEPT); }

}