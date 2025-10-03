---
title: "Electromagnetism: Electric and Magnetic Fields"
date: 2025-10-03
draft: false
description: "Understanding electric and magnetic fields, their properties and interactions"
lessons: ["Physics"]
topics: ["electromagnetism", "electric-fields", "magnetic-fields", "maxwell-equations"]
---

## Introduction to Electromagnetism

Electromagnetism is one of the four fundamental forces of nature, governing the interactions between electrically charged particles. This field unifies electricity and magnetism into a single comprehensive theory.

## Electric Fields

### Definition
An electric field is a region of space around a charged particle where other charged particles experience a force.

### Electric Field Strength
The electric field **E** at a point is defined as the force per unit charge:

$$\vec{E} = \frac{\vec{F}}{q}$$

Where:
- $\vec{E}$ = Electric field strength (N/C or V/m)
- $\vec{F}$ = Force on test charge (N)
- $q$ = Test charge (C)

### Point Charge Electric Field
For a point charge $Q$, the electric field at distance $r$ is:

$$E = \frac{kQ}{r^2}$$

Where $k = 8.99 \times 10^9$ N·m²/C² (Coulomb's constant)

### Example Problem 1: Electric Field Calculation

**Problem**: Calculate the electric field 2 meters away from a charge of +5 μC.

**Solution**:
$$E = \frac{kQ}{r^2} = \frac{(8.99 \times 10^9)(5 \times 10^{-6})}{(2)^2}$$

$$E = \frac{44950}{4} = 11,237.5 \text{ N/C}$$

The electric field is **11,237.5 N/C** directed radially outward from the charge.

## Electric Potential

### Definition
Electric potential $V$ is the potential energy per unit charge:

$$V = \frac{U}{q}$$

### Relationship to Electric Field
The electric field is the negative gradient of potential:

$$\vec{E} = -\nabla V$$

For uniform fields:
$$E = -\frac{\Delta V}{\Delta x}$$

### Point Charge Potential
$$V = \frac{kQ}{r}$$

## Magnetic Fields

### Definition
A magnetic field is a vector field that describes the magnetic influence on moving electric charges, electric currents, and magnetic materials.

### Magnetic Force on Moving Charge
The force on a charge $q$ moving with velocity $\vec{v}$ in a magnetic field $\vec{B}$:

$$\vec{F} = q(\vec{v} \times \vec{B})$$

Magnitude:
$$F = qvB\sin\theta$$

Where $\theta$ is the angle between $\vec{v}$ and $\vec{B}$.

### Magnetic Force on Current-Carrying Wire
For a wire of length $L$ carrying current $I$:

$$\vec{F} = I(\vec{L} \times \vec{B})$$

Magnitude:
$$F = BIL\sin\theta$$

### Example Problem 2: Magnetic Force

**Problem**: A proton moves at $3 \times 10^6$ m/s perpendicular to a magnetic field of 0.5 T. Calculate the magnetic force.

**Solution**:
- $q = 1.6 \times 10^{-19}$ C (proton charge)
- $v = 3 \times 10^6$ m/s
- $B = 0.5$ T
- $\theta = 90°$ (perpendicular)

$$F = qvB\sin(90°) = (1.6 \times 10^{-19})(3 \times 10^6)(0.5)(1)$$

$$F = 2.4 \times 10^{-13} \text{ N}$$

## Electromagnetic Induction

### Faraday's Law
A changing magnetic flux through a loop induces an EMF:

$$\mathcal{E} = -\frac{d\Phi_B}{dt}$$

Where $\Phi_B = \vec{B} \cdot \vec{A}$ is the magnetic flux.

### Lenz's Law
The induced current creates a magnetic field that opposes the change in flux that produced it.

### Example Problem 3: Induced EMF

**Problem**: A circular coil with 50 turns and radius 0.1 m is in a magnetic field that increases from 0 to 0.5 T in 2 seconds. Calculate the induced EMF.

**Solution**:
- $N = 50$ turns
- $A = \pi r^2 = \pi(0.1)^2 = 0.0314$ m²
- $\Delta B = 0.5$ T
- $\Delta t = 2$ s

$$\mathcal{E} = -N\frac{\Delta(BA)}{\Delta t} = -50 \times \frac{(0.5)(0.0314)}{2}$$

$$\mathcal{E} = -0.393 \text{ V}$$

The magnitude of induced EMF is **0.393 V**.

## Maxwell's Equations

The four fundamental equations of electromagnetism:

### 1. Gauss's Law (Electric)
$$\oint \vec{E} \cdot d\vec{A} = \frac{Q_{enc}}{\epsilon_0}$$

Electric flux through a closed surface equals enclosed charge.

### 2. Gauss's Law (Magnetic)
$$\oint \vec{B} \cdot d\vec{A} = 0$$

No magnetic monopoles exist.

### 3. Faraday's Law
$$\oint \vec{E} \cdot d\vec{l} = -\frac{d\Phi_B}{dt}$$

Changing magnetic field induces electric field.

### 4. Ampère-Maxwell Law
$$\oint \vec{B} \cdot d\vec{l} = \mu_0\left(I_{enc} + \epsilon_0\frac{d\Phi_E}{dt}\right)$$

Current and changing electric field create magnetic field.

## Electromagnetic Waves

### Wave Equation
In vacuum, electromagnetic waves travel at the speed of light:

$$c = \frac{1}{\sqrt{\mu_0\epsilon_0}} = 3 \times 10^8 \text{ m/s}$$

### Relationship Between E and B
In an electromagnetic wave:

$$\frac{E}{B} = c$$

### Energy Density
$$u = \frac{1}{2}\left(\epsilon_0 E^2 + \frac{B^2}{\mu_0}\right)$$

## Applications

1. **Electric Motors**: Conversion of electrical energy to mechanical energy
2. **Generators**: Electromagnetic induction produces electricity
3. **Transformers**: Changing voltage levels in AC circuits
4. **Radio Communication**: Electromagnetic waves for information transmission
5. **MRI Machines**: Strong magnetic fields for medical imaging
6. **Particle Accelerators**: Magnetic fields guide charged particles

## Key Concepts Summary

| Concept | Formula | Units |
|---------|---------|-------|
| Electric Field | $E = \frac{F}{q}$ | N/C or V/m |
| Electric Potential | $V = \frac{kQ}{r}$ | V (volts) |
| Magnetic Force | $F = qvB\sin\theta$ | N (newtons) |
| Magnetic Flux | $\Phi_B = BA\cos\theta$ | Wb (weber) |
| Induced EMF | $\mathcal{E} = -\frac{d\Phi_B}{dt}$ | V (volts) |

## Conclusion

Electromagnetism is a cornerstone of modern physics, explaining phenomena from the atomic scale to cosmic distances. Understanding electric and magnetic fields, their interactions, and Maxwell's equations provides the foundation for countless technologies and deeper physical theories.

## Further Reading
- Electromagnetic wave propagation
- Quantum electrodynamics
- Electromagnetic spectrum
- Applications in modern technology
