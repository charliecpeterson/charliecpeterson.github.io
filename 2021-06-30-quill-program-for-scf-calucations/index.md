# Quill Program for SCF calucations 


<script src="{{< blogdown/postref >}}index.en_files/header-attrs/header-attrs.js"></script>

<div id="TOC">

</div>

<p>The QUILL program is a small simple program to run computational chemistry calculations</p>
<!--more-->
<div id="program-quill" class="section level1">
<h1>Program Quill</h1>
<p>I have updated on GitHub a small, very simple Hartree Fock program, mostly written in C. I mostly wrote this code as a test to program Hartree Fock. I am thinking of adding more functions.</p>
<p>The code is located on my GitHub page <a href="https://github.com/charliecpeterson/QUILL" class="uri">https://github.com/charliecpeterson/QUILL</a></p>
<p>This program uses <a href="https://github.com/pyscf/pyscf">PySCF</a> and <a href="https://github.com/sunqm/libcint">libcint</a> to generate the 1e/2e integrals. It also uses the <a href="https://eigen.tuxfamily.org/dox/">Eigen3</a> API for all Matrix/linear algbra routines.</p>
<p>The input is very similar to NWChem. In the GitHub repo, there is a sample input <code>input.inp</code></p>
<pre><code>geometry
C  -0.000000000000   0.000000000000   0.000000000000
H   1.183771681898  -1.183771681898  -1.183771681898
H   1.183771681898   1.183771681898   1.183771681898
H  -1.183771681898   1.183771681898  -1.183771681898
H  -1.183771681898  -1.183771681898   1.183771681898
end

basis
H    S
      3.387000E+01           6.068000E-03           0.000000E+00           0.000000E+00
      5.095000E+00           4.530800E-02           0.000000E+00           0.000000E+00
      1.159000E+00           2.028220E-01           0.000000E+00           0.000000E+00
      3.258000E-01           5.039030E-01           1.000000E+00           0.000000E+00
      1.027000E-01           3.834210E-01           0.000000E+00           1.000000E+00
H    P
      1.407000E+00           1.000000E+00           0.000000E+00
      3.880000E-01           0.000000E+00           1.000000E+00
H    D
      1.057000E+00           1.0000000
C    S
      8.236000E+03           5.310000E-04          -1.130000E-04           0.000000E+00           0.000000E+00
      1.235000E+03           4.108000E-03          -8.780000E-04           0.000000E+00           0.000000E+00
      2.808000E+02           2.108700E-02          -4.540000E-03           0.000000E+00           0.000000E+00
      7.927000E+01           8.185300E-02          -1.813300E-02           0.000000E+00           0.000000E+00
      2.559000E+01           2.348170E-01          -5.576000E-02           0.000000E+00           0.000000E+00
      8.997000E+00           4.344010E-01          -1.268950E-01           0.000000E+00           0.000000E+00
      3.319000E+00           3.461290E-01          -1.703520E-01           0.000000E+00           0.000000E+00
      9.059000E-01           3.937800E-02           1.403820E-01           1.000000E+00           0.000000E+00
      3.643000E-01          -8.983000E-03           5.986840E-01           0.000000E+00           0.000000E+00
      1.285000E-01           2.385000E-03           3.953890E-01           0.000000E+00           1.000000E+00
C    P
      1.871000E+01           1.403100E-02           0.000000E+00           0.000000E+00
      4.133000E+00           8.686600E-02           0.000000E+00           0.000000E+00
      1.200000E+00           2.902160E-01           0.000000E+00           0.000000E+00
      3.827000E-01           5.010080E-01           1.000000E+00           0.000000E+00
      1.209000E-01           3.434060E-01           0.000000E+00           1.000000E+00
C    D
      1.097000E+00           1.000000E+00           0.000000E+00
      3.180000E-01           0.000000E+00           1.000000E+00
C    F
      7.610000E-01           1.0000000
end

scf
num_elec 10
end</code></pre>
<p>As of now, there are only three input blocks that is code accepts</p>
<ul>
<li>geometry</li>
<li>basis</li>
<li>scf</li>
</ul>
<p>The <strong>geometry</strong> and <strong>basis</strong> blocks are very similar to NWChem, in fact, the basis set format is the same for NWCehm</p>
<p>The <strong>scf</strong> block only accepts num_elec. This code ONLY does RHF. Single reference, closed-shell systems ONLY</p>
<p>I have tested this on a few compounds and it is about 10^-2 AU in energy different from results from PySCF. More work is needed.</p>
<p>I’m thinking of using this program as a starting point to add and test new libraries to run computational chemistry methods, esp to the Exascale.</p>
<p>Contact Me for any more information!</p>
</div>

