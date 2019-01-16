function [ output_args ] = AddTwoParticleStream(num1, num2, x01, y01, x02, y02, PartAng1, PartAng2, Type1, Type2, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type1 == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

if Type2 == 0
    Mass = Mass0;
else
    Mass = Mass1;
end


for p = 0:num1 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x01 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng1);
    y(nAtoms) = y01 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng1);
    AtomType(nAtoms) = Type1;
end

for p = 0:num2 - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x02 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng2);
    y(nAtoms) = y02 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng2);
    AtomType(nAtoms) = Type2;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num1
    Vx(nAtoms - num1 + p) = V * cos(PartAng1);
    Vy(nAtoms - num1 + p) = V * sin(PartAng1);
end

for p = 1:num2
    Vx(nAtoms - num2 + p) = V * cos(PartAng2);
    Vy(nAtoms - num2 + p) = V * sin(PartAng2);
end

end
