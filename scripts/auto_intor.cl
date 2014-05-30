#!/usr/bin/env clisp 

(load "gen-code.cl")

(gen-cint "auto_intor1.c" 'spheric
  '("cint1e_ovlp_sph"   ( \| ))
  '("cint1e_nuc_sph"    ( \| nuc \| ))
  '("cint1e_kin_sph"    (.5 \| p dot p))
  '("cint1e_ia01p_sph"  (#C(0 1) \| nabla-rinv \| cross p))
  '("cint1e_giao_irjxp_sph" (#C(0 1) \| r cross p))
  '("cint1e_cg_irxp_sph" (#C(0 1) \| rc cross p))
  '("cint1e_giao_a11part_sph" (-.5 \| nabla-rinv \| r))
  '("cint1e_cg_a11part_sph" (-.5 \| nabla-rinv \| rc))
  '("cint1e_a01gp_sph"  (g \| nabla-rinv cross p \|))
  '("cint1e_igkin_sph"  (#C(0 .5) g \| p dot p))
  '("cint1e_igovlp_sph" (#C(0 1) g \|))
  '("cint1e_ignuc_sph"  (#C(0 1) g \| nuc \|))
  ; use p* instead of p, to ignore the operator after it, then it can
  ; cross to the next p
  '("cint1e_prinvxp_sph" (p* \| rinv cross p \| ))
  ;'("cint2e_sph"        ( \, \| \, ))
  '("cint2e_ig1_sph"    (#C(0 1) g \, \| \, ))
)

(gen-cint "auto_intor2.c" 'spinor
  '("cint1e_ovlp"         ( \| ))
  '("cint1e_nuc"          ( \| nuc \|))
  '("cint1e_srsr"         (sigma dot r \| sigma dot r))
  '("cint1e_sr"           (sigma dot r \|))
  '("cint1e_srsp"         (sigma dot r \| sigma dot p))
  '("cint1e_spsp"         (sigma dot p \| sigma dot p))
  '("cint1e_sp"           (sigma dot p \|))
  '("cint1e_spnucsp"      (sigma dot p \| nuc \| sigma dot p))
  '("cint1e_srnucsr"      (sigma dot r \| nuc \| sigma dot r))
  '("cint1e_govlp"        (g \|))
  '("cint1e_gnuc"         (g \| nuc \|))
  '("cint1e_cg_sa10sa01"  (.5 sigma cross rc \| sigma cross nabla-rinv \|))
  '("cint1e_cg_sa10sp"    (.5 rc cross sigma \| sigma dot p))
  '("cint1e_cg_sa10nucsp" (.5 rc cross sigma \| nuc \| sigma dot p))
  '("cint1e_giao_sa10sa01"  (.5 sigma cross r \| sigma cross nabla-rinv \|))
  '("cint1e_giao_sa10sp"    (.5 r cross sigma \| sigma dot p))
  '("cint1e_giao_sa10nucsp" (.5 r cross sigma \| nuc \| sigma dot p))
  '("cint1e_sa01sp"       (\| nabla-rinv cross sigma \| sigma dot p))
  '("cint1e_spgsp"        (g sigma dot p \| sigma dot p))
  '("cint1e_spgnucsp"     (g sigma dot p \| nuc \| sigma dot p))
  '("cint1e_spgsa01"      (g sigma dot p \| nabla-rinv cross sigma \|))
  ;'("cint2e"              (, \| \, ))
  '("cint2e_spsp1"        (sigma dot p \, sigma dot p \| \, ))
  '("cint2e_spsp1spsp2"   (sigma dot p \, sigma dot p \| sigma dot p \, sigma dot p ))
  '("cint2e_srsr1"        (sigma dot r \, sigma dot r \| \,))
  '("cint2e_srsr1srsr2"   (sigma dot r \, sigma dot r \| sigma dot r \, sigma dot r))
  '("cint2e_cg_sa10sp1"   (.5 rc cross sigma \, sigma dot p \| \,))
  '("cint2e_cg_sa10sp1spsp2" (.5 rc cross sigma \, sigma dot p \| sigma dot p \, sigma dot p ))
  '("cint2e_giao_sa10sp1"   (.5 r cross sigma \, sigma dot p \| \,))
  '("cint2e_giao_sa10sp1spsp2" (.5 r cross sigma \, sigma dot p \| sigma dot p \, sigma dot p ))
  '("cint2e_g1"           (g \, \| \,))
  '("cint2e_spgsp1"       (g sigma dot p \, sigma dot p \| \,))
  '("cint2e_g1spsp2"      (g \, \| sigma dot p \, sigma dot p))
  '("cint2e_spgsp1spsp2"  (g sigma dot p \, sigma dot p \| sigma dot p \, sigma dot p))
  ; for DKB
  '("cint1e_spspsp"     (sigma dot p \| sigma dot p sigma dot p))
  '("cint1e_spnuc"      (sigma dot p \| nuc \|))
  '("cint2e_spv1"       (sigma dot p \, \| \,))
  '("cint2e_vsp1"       (\, sigma dot p \| \,))
  '("cint2e_spsp2"      (\, \| sigma dot p \, sigma dot p))
  '("cint2e_spv1spv2"   (sigma dot p \, \| sigma dot p \,))
  '("cint2e_vsp1spv2"   (\, sigma dot p \| sigma dot p \,))
  '("cint2e_spv1vsp2"   (sigma dot p \, \| \, sigma dot p))
  '("cint2e_vsp1vsp2"   (\, sigma dot p \| \, sigma dot p))
  '("cint2e_spv1spsp2"  (sigma dot p \, \| sigma dot p \, sigma dot p))
  '("cint2e_vsp1spsp2"  (\, sigma dot p \| sigma dot p \, sigma dot p))
)

(gen-cint "auto_intor3.c" 'cart
  '("cint1e_ovlp_cart"   ( \| ))
  '("cint1e_nuc_cart"    ( \| nuc \| ))
  '("cint1e_kin_cart"    (.5 \| p dot p))
  '("cint1e_ia01p_cart"  (#C(0 1) \| nabla-rinv \| cross p))
  '("cint1e_giao_irjxp_cart" (#C(0 1) \| r cross p))
  '("cint1e_cg_irxp_cart" (#C(0 1) \| rc cross p))
  '("cint1e_giao_a11part_cart" (-.5 \| nabla-rinv \| r))
  '("cint1e_cg_a11part_cart" (-.5 \| nabla-rinv \| rc))
  '("cint1e_a01gp_cart"  (g \| nabla-rinv cross p \|))
  '("cint1e_igkin_cart"  (#C(0 .5) g \| p dot p))
  '("cint1e_igovlp_cart" (#C(0 1) g \|))
  '("cint1e_ignuc_cart"  (#C(0 1) g \| nuc \|))
  '("cint2e_ig1_cart"    (#C(0 1) g \, \| \, ))
)

(gen-cint "grad1.c" 'spheric
  '("cint1e_ipovlp_sph" (nabla \|))
  '("cint1e_ipkin_sph"  (.5 nabla \| p dot p))
  '("cint1e_ipnuc_sph"  (nabla \| nuc \|))
  '("cint1e_iprinv_sph" (nabla \| rinv \|))
  '("cint1e_rinv_sph"   (\| rinv \|))
  '("cint2e_ip1_sph"    (nabla \, \| \,))
)

(gen-cint "grad2.c" 'spinor
  '("cint1e_ipovlp"       (nabla \|))
  '("cint1e_ipkin"        (.5 nabla \| p dot p))
  '("cint1e_ipnuc"        (nabla \| nuc \|))
  '("cint1e_iprinv"       (nabla \| rinv \|))
  '("cint1e_ipspnucsp"    (nabla sigma dot p \| nuc \| sigma dot p))
  '("cint1e_ipsprinvsp"   (nabla sigma dot p \| rinv \| sigma dot p))
  '("cint2e_ip1"          (nabla \, \| \,))
  '("cint2e_ipspsp1"      (nabla sigma dot p \, sigma dot p \| \,))
  '("cint2e_ip1spsp2"     (nabla \, \| sigma dot p \, sigma dot p))
  '("cint2e_ipspsp1spsp2" (nabla sigma dot p \, sigma dot p \| sigma dot p \, sigma dot p))
)

(gen-cint "grad3.c" 'cart
  '("cint1e_ipovlp_cart" (nabla \|))
  '("cint1e_ipkin_cart"  (.5 nabla \| p dot p))
  '("cint1e_ipnuc_cart"  (nabla \| nuc \|))
  '("cint1e_iprinv_cart" (nabla \| rinv \|))
  '("cint1e_rinv_cart"   (\| rinv \|))
  '("cint2e_ip1_cart"    (nabla \, \| \,))
)

(gen-cint "gaunt1.c" 'spinor
  '("cint2e_ssp1ssp2"   ( \, sigma dot p \| gaunt \| \, sigma dot p))
  '("cint2e_cg_ssa10ssp2"   (rc cross sigma \, \| gaunt \| \, sigma dot p))
  '("cint2e_giao_ssa10ssp2" (r cross sigma  \, \| gaunt \| \, sigma dot p))
  '("cint2e_gssp1ssp2"      (g \, sigma dot p  \| gaunt \| \, sigma dot p))
)
