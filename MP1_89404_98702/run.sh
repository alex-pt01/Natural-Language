#!/bin/bash

mkdir -p compiled images

for i in sources/*.txt tests/*.txt; do
	echo "Compiling: $i"
    fstcompile --isymbols=syms.txt --osymbols=syms.txt $i | fstarcsort > compiled/$(basename $i ".txt").fst
done


echo "Testing the transducer 'mm2mmm' with the input 'tests/Test_mm2mmm.txt' (generating pdf/stdout)"
fstcompose compiled/Test_mm2mmm.fst compiled/mm2mmm.fst | fstshortestpath > compiled/Resmm2mmm.fst
fstcompose compiled/Test_mm2mmm.fst compiled/mm2mmm.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'd2dd' with the input 'tests/Test_d2dd_1_digito.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dd_1_digito.fst compiled/d2dd.fst | fstshortestpath > compiled/Resd2dd_1_digito.fst
fstcompose compiled/Test_d2dd_1_digito.fst compiled/d2dd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
echo "Testing the transducer 'd2dd' with the input 'tests/Test_d2dd_2_digito.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dd_2_digitos.fst compiled/d2dd.fst | fstshortestpath > compiled/Resd2dd_2_digitos.fst
fstcompose compiled/Test_d2dd_2_digitos.fst compiled/d2dd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'd2dddd' with the input 'tests/Test_d2dddd_1_digito.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dddd_1_digito.fst compiled/d2dddd.fst | fstshortestpath > compiled/Resd2dddd_1_digito.fst
fstcompose compiled/Test_d2dddd_1_digito.fst compiled/d2dddd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
echo "Testing the transducer 'd2dddd' with the input 'tests/Test_d2dddd_2_digitos.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dddd_2_digitos.fst compiled/d2dddd.fst | fstshortestpath > compiled/Resd2dddd_2_digitos.fst
fstcompose compiled/Test_d2dddd_2_digitos.fst compiled/d2dddd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
echo "Testing the transducer 'd2dddd' with the input 'tests/Test_d2dddd_3_digitos.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dddd_3_digitos.fst compiled/d2dddd.fst | fstshortestpath > compiled/Resd2dddd_3_digitos.fst
fstcompose compiled/Test_d2dddd_3_digitos.fst compiled/d2dddd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
echo "Testing the transducer 'd2dddd' with the input 'tests/Test_d2dddd_4_digitos.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dddd_4_digitos.fst compiled/d2dddd.fst | fstshortestpath > compiled/Resd2dddd_4_digitos.fst
fstcompose compiled/Test_d2dddd_4_digitos.fst compiled/d2dddd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
echo "Testing the transducer 'd2dddd' with the input 'tests/Test_d2dddd_6_digitos.txt' (generating pdf/stdout)"
fstcompose compiled/Test_d2dddd_6_digitos.fst compiled/d2dddd.fst | fstshortestpath > compiled/Resd2dddd_6_digitos.fst
fstcompose compiled/Test_d2dddd_6_digitos.fst compiled/d2dddd.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'copy' with the input 'tests/Test_copy.txt' (generating pdf/stdout)"
fstcompose compiled/Test_copy.fst compiled/copy.fst | fstshortestpath > compiled/Rescopy.fst
fstcompose compiled/Test_copy.fst compiled/copy.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'skip' with the input 'tests/Test_skip.txt' (generating pdf/stdout)"
fstcompose compiled/Test_skip.fst compiled/skip.fst | fstshortestpath > compiled/Resskip.fst
fstcompose compiled/Test_skip.fst compiled/skip.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'date2year' with the input 'tests/Test_date2year.txt' (generating pdf/stdout)"
fstcompose compiled/Test_date2year.fst compiled/date2year.fst | fstshortestpath > compiled/Resdate2year.fst
fstcompose compiled/Test_date2year.fst compiled/date2year.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "Testing the transducer 'leap' with the input 'tests/Test_leap.txt' (generating pdf/stdout)"
fstcompose compiled/Test_leap.fst compiled/leap.fst | fstshortestpath > compiled/Resleap.fst
fstcompose compiled/Test_leap.fst compiled/leap.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'R2A' with the input 'tests/Test_R2A.txt' (generating pdf/stdout)"
fstcompose compiled/Test_R2A.fst compiled/R2A.fst | fstshortestpath > compiled/ResR2A.fst
fstcompose compiled/Test_R2A.fst compiled/R2A.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'R2A' with the input 'tests/Test_1_R2A.txt' (generating pdf/stdout)"
fstcompose compiled/Test_1_R2A.fst compiled/R2A.fst | fstshortestpath > compiled/Res_1_R2A.fst
fstcompose compiled/Test_1_R2A.fst compiled/R2A.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt




echo "Exercise 2"
echo "A2R"
fstinvert compiled/R2A.fst compiled/A2R.fst

echo "Testing the transducer 'A2R' with the input 'tests/Test_A2R.txt' (generating pdf/stdout)"
fstcompose compiled/Test_A2R.fst compiled/A2R.fst | fstshortestpath > compiled/Res_A2R.fst
fstcompose compiled/Test_A2R.fst compiled/A2R.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "birthR2A"
fstcompose compiled/R2A.fst compiled/d2dd.fst compiled/Atest.fst |
fstcompose compiled/R2A.fst compiled/d2dd.fst compiled/AAtest.fst |
fstcompose compiled/R2A.fst compiled/d2dddd.fst compiled/AAAtest.fst |

fstconcat compiled/Atest.fst compiled/copy.fst compiled/Btest.fst |
fstconcat compiled/Btest.fst compiled/AAtest.fst compiled/Ctest.fst |

fstconcat compiled/Ctest.fst compiled/copy.fst compiled/Dtest.fst |
fstconcat compiled/Dtest.fst compiled/AAAtest.fst compiled/birthR2A.fst 



echo "birthA2T"
fstconcat compiled/d2dd.fst compiled/copy.fst compiled/AbirthA2T.fst |
fstconcat compiled/AbirthA2T.fst compiled/mm2mmm.fst compiled/BbirthA2T.fst |
fstconcat compiled/BbirthA2T.fst compiled/copy.fst compiled/CbirthA2T.fst |
fstconcat compiled/CbirthA2T.fst compiled/d2dddd.fst compiled/birthA2T.fst 


echo "birthT2R"

# fstinvert compiled/birthR2A.fst compiled/testA2R.fst |
# fstcompose compiled/testA2R.fst compiled/birthA2T.fst compiled/ToInvBirthT2R.fst |
# fstinvert compiled/ToInvBirthT2R.fst compiled/birthT2R.fst 

fstinvert compiled/mm2mmm.fst compiled/mm2mmmInverted.fst |
fstinvert compiled/d2dd.fst compiled/d2ddInverted.fst |
fstinvert compiled/d2dd.fst compiled/d2ddInverted1.fst |
fstcompose compiled/mm2mmmInverted.fst compiled/d2ddInverted1.fst compiled/intermedioT2R.fst |
fstcompose compiled/intermedioT2R.fst compiled/A2R.fst compiled/intermedioT2R1.fst |

fstcompose compiled/d2ddInverted.fst compiled/A2R.fst compiled/AbirthT2R.fst |
fstconcat compiled/AbirthT2R.fst compiled/copy.fst compiled/BbirthT2R.fst |
fstconcat compiled/BbirthT2R.fst compiled/intermedioT2R1.fst compiled/CbirthT2R.fst |
fstconcat compiled/CbirthT2R.fst compiled/copy.fst compiled/DbirthT2R.fst |
fstconcat compiled/DbirthT2R.fst compiled/A2R.fst compiled/birthT2R.fst 

echo "birthR2L"
fstcompose compiled/birthR2A.fst compiled/date2year.fst compiled/AbirthR2L.fst |
fstcompose compiled/AbirthR2L.fst compiled/leap.fst compiled/birthR2L.fst 



echo "Exercise 3"
echo "birthR2A Test"
echo "Testing the transducer 'birthR2A' with the input 'tests/Test_birthR2A_98702.txt' (generating pdf/stdout)"
fstcompose compiled/98702birthR2A_Test.fst compiled/birthR2A.fst | fstshortestpath > compiled/98702birthR2A.fst
fstcompose compiled/98702birthR2A_Test.fst compiled/birthR2A.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'birthR2A' with the input 'tests/Test_birthR2A_89404.txt' (generating pdf/stdout)"
fstcompose compiled/89404birthR2A_Test.fst compiled/birthR2A.fst | fstshortestpath > compiled/89404birthR2A.fst
fstcompose compiled/89404birthR2A_Test.fst compiled/birthR2A.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt



echo "birthA2T Test"
echo "Testing the transducer 'birthA2T' with the input 'tests/Test_birthA2T_98702.txt' (generating pdf/stdout)"
fstcompose compiled/98702birthA2T_Test.fst compiled/birthA2T.fst | fstshortestpath > compiled/98702birthA2T.fst
fstcompose compiled/98702birthA2T_Test.fst compiled/birthA2T.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'birthA2T' with the input 'tests/Test_birthA2T_89404.txt' (generating pdf/stdout)"
fstcompose compiled/89404birthA2T_Test.fst compiled/birthA2T.fst | fstshortestpath > compiled/89404birthA2T.fst
fstcompose compiled/89404birthA2T_Test.fst compiled/birthA2T.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt



echo "birthT2R Test"
echo "Testing the transducer 'birthT2R' with the input 'tests/Test_birthT2R_98702.txt' (generating pdf/stdout)"
fstcompose compiled/98702birthT2R_Test.fst compiled/birthT2R.fst | fstshortestpath > compiled/98702birthT2R.fst
fstcompose compiled/98702birthT2R_Test.fst compiled/birthT2R.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'birthT2R' with the input 'tests/Test_birthT2R_89404.txt' (generating pdf/stdout)"
fstcompose compiled/89404birthT2R_Test.fst compiled/birthT2R.fst | fstshortestpath > compiled/89404birthT2R.fst
fstcompose compiled/89404birthT2R_Test.fst compiled/birthT2R.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt


echo "birthR2L Test"
echo "Testing the transducer 'birthR2L' with the input 'tests/Test_birthR2L_98702.txt' (generating pdf/stdout)"
fstcompose compiled/98702birthR2L_Test.fst compiled/birthR2L.fst | fstshortestpath > compiled/98702birthR2L.fst
fstcompose compiled/98702birthR2L_Test.fst compiled/birthR2L.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt

echo "Testing the transducer 'birthR2L' with the input 'tests/Test_birthR2L_89404.txt' (generating pdf/stdout)"
fstcompose compiled/89404birthR2L_Test.fst compiled/birthR2L.fst | fstshortestpath > compiled/89404birthR2L.fst
fstcompose compiled/89404birthR2L_Test.fst compiled/birthR2L.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
























echo "Testing the transducer 'converter' with the input 'tests/numeroR.txt' (generating pdf)"
fstcompose compiled/numeroR.fst compiled/converter.fst | fstshortestpath > compiled/numeroA.fst

for i in compiled/*.fst; do
	echo "Creating image: images/$(basename $i '.fst').pdf"
    fstdraw --portrait --isymbols=syms.txt --osymbols=syms.txt $i | dot -Tpdf > images/$(basename $i '.fst').pdf
done

echo "Testing the transducer 'converter' with the input 'tests/numeroR.txt' (stdout)"
fstcompose compiled/numeroR.fst compiled/converter.fst | fstshortestpath | fstproject --project_output=true | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=./syms.txt
