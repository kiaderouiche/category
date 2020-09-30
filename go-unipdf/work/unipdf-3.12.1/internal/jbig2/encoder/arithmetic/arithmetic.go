//
// Copyright 2020 FoxyUtils ehf. All rights reserved.
//
// This is a commercial product and requires a license to operate.
// A trial license can be obtained at https://unidoc.io
//
// DO NOT EDIT: generated by unitwist Go source code obfuscator.
//
// Use of this source code is governed by the UniDoc End User License Agreement
// terms that can be accessed at https://unidoc.io/eula/

package arithmetic ;import (_db "bytes";_ag "github.com/unidoc/unipdf/v3/common";_g "github.com/unidoc/unipdf/v3/internal/jbig2/bitmap";_c "github.com/unidoc/unipdf/v3/internal/jbig2/errors";_a "io";);func (_fcc *Encoder )renormalize (){for {_fcc ._cd <<=1;_fcc ._agb <<=1;_fcc ._dg --;if _fcc ._dg ==0{_fcc .byteOut ();};if (_fcc ._cd &0x8000)!=0{break ;};};};func (_bea *Encoder )Reset (){_bea ._cd =0x8000;_bea ._agb =0;_bea ._dg =12;_bea ._eb =-1;_bea ._fba =0;_bea ._aag =nil ;_bea ._gb =_bd (_efc );};type codingContext struct{_fb []byte ;_dd []byte ;};func (_fcd *Encoder )EncodeInteger (proc Class ,value int )(_ccd error ){_ag .Log .Trace ("\u0045\u006eco\u0064\u0065\u0020I\u006e\u0074\u0065\u0067er:\u0027%d\u0027\u0020\u0077\u0069\u0074\u0068\u0020Cl\u0061\u0073\u0073\u003a\u0020\u0027\u0025s\u0027",value ,proc );if _ccd =_fcd .encodeInteger (proc ,value );_ccd !=nil {return _c .Wrap (_ccd ,"\u0045\u006e\u0063\u006f\u0064\u0065\u0049\u006e\u0074\u0065\u0067\u0065\u0072","");};return nil ;};var _dff =[]state {{0x5601,1,1,1},{0x3401,2,6,0},{0x1801,3,9,0},{0x0AC1,4,12,0},{0x0521,5,29,0},{0x0221,38,33,0},{0x5601,7,6,1},{0x5401,8,14,0},{0x4801,9,14,0},{0x3801,10,14,0},{0x3001,11,17,0},{0x2401,12,18,0},{0x1C01,13,20,0},{0x1601,29,21,0},{0x5601,15,14,1},{0x5401,16,14,0},{0x5101,17,15,0},{0x4801,18,16,0},{0x3801,19,17,0},{0x3401,20,18,0},{0x3001,21,19,0},{0x2801,22,19,0},{0x2401,23,20,0},{0x2201,24,21,0},{0x1C01,25,22,0},{0x1801,26,23,0},{0x1601,27,24,0},{0x1401,28,25,0},{0x1201,29,26,0},{0x1101,30,27,0},{0x0AC1,31,28,0},{0x09C1,32,29,0},{0x08A1,33,30,0},{0x0521,34,31,0},{0x0441,35,32,0},{0x02A1,36,33,0},{0x0221,37,34,0},{0x0141,38,35,0},{0x0111,39,36,0},{0x0085,40,37,0},{0x0049,41,38,0},{0x0025,42,39,0},{0x0015,43,40,0},{0x0009,44,41,0},{0x0005,45,42,0},{0x0001,45,43,0},{0x5601,46,46,0}};func (_dfd *Encoder )codeMPS (_afa *codingContext ,_aec uint32 ,_fgca uint16 ,_dcg byte ){_dfd ._cd -=_fgca ;if _dfd ._cd &0x8000!=0{_dfd ._agb +=uint32 (_fgca );return ;};if _dfd ._cd < _fgca {_dfd ._cd =_fgca ;}else {_dfd ._agb +=uint32 (_fgca );};_afa ._fb [_aec ]=_dff [_dcg ]._dgc ;_dfd .renormalize ();};func _bd (_ef int )*codingContext {return &codingContext {_fb :make ([]byte ,_ef ),_dd :make ([]byte ,_ef )};};func (_bg *Encoder )EncodeBitmap (bm *_g .Bitmap ,duplicateLineRemoval bool )error {_ag .Log .Trace ("\u0045n\u0063\u006f\u0064\u0065 \u0042\u0069\u0074\u006d\u0061p\u0020[\u0025d\u0078\u0025\u0064\u005d\u002c\u0020\u0025s",bm .Width ,bm .Height ,bm );var (_ddf ,_bde uint8 ;_fdf ,_gf ,_fc uint16 ;_be ,_dbe ,_ca byte ;_ad ,_fcg ,_gee int ;_gc ,_aea []byte ;);for _dc :=0;_dc < bm .Height ;_dc ++{_be ,_dbe =0,0;if _dc >=2{_be =bm .Data [(_dc -2)*bm .RowStride ];};if _dc >=1{_dbe =bm .Data [(_dc -1)*bm .RowStride ];if duplicateLineRemoval {_fcg =_dc *bm .RowStride ;_gc =bm .Data [_fcg :_fcg +bm .RowStride ];_gee =(_dc -1)*bm .RowStride ;_aea =bm .Data [_gee :_gee +bm .RowStride ];if _db .Equal (_gc ,_aea ){_bde =_ddf ^1;_ddf =1;}else {_bde =_ddf ;_ddf =0;};};};if duplicateLineRemoval {if _eg :=_bg .encodeBit (_bg ._gb ,_bab ,_bde );_eg !=nil {return _eg ;};if _ddf !=0{continue ;};};_ca =bm .Data [_dc *bm .RowStride ];_fdf =uint16 (_be >>5);_gf =uint16 (_dbe >>4);_be <<=3;_dbe <<=4;_fc =0;for _ad =0;_ad < bm .Width ;_ad ++{_bcf :=uint32 (_fdf <<11|_gf <<4|_fc );_de :=(_ca &0x80)>>7;_da :=_bg .encodeBit (_bg ._gb ,_bcf ,_de );if _da !=nil {return _da ;};_fdf <<=1;_gf <<=1;_fc <<=1;_fdf |=uint16 ((_be &0x80)>>7);_gf |=uint16 ((_dbe &0x80)>>7);_fc |=uint16 (_de );_cc :=_ad %8;_ac :=_ad /8+1;if _cc ==4&&_dc >=2{_be =0;if _ac < bm .RowStride {_be =bm .Data [(_dc -2)*bm .RowStride +_ac ];};}else {_be <<=1;};if _cc ==3&&_dc >=1{_dbe =0;if _ac < bm .RowStride {_dbe =bm .Data [(_dc -1)*bm .RowStride +_ac ];};}else {_dbe <<=1;};if _cc ==7{_ca =0;if _ac < bm .RowStride {_ca =bm .Data [_dc *bm .RowStride +_ac ];};}else {_ca <<=1;};_fdf &=31;_gf &=127;_fc &=15;};};return nil ;};func (_bda *Encoder )emit (){if _bda ._ge ==_cff {_bda ._gd =append (_bda ._gd ,_bda ._fd );_bda ._fd =make ([]byte ,_cff );_bda ._ge =0;};_bda ._fd [_bda ._ge ]=_bda ._fba ;_bda ._ge ++;};const (_efc =65536;_cff =20*1024;);func (_ccea *Encoder )lBlock (){if _ccea ._eb >=0{_ccea .emit ();};_ccea ._eb ++;_ccea ._fba =uint8 (_ccea ._agb >>19);_ccea ._agb &=0x7ffff;_ccea ._dg =8;};const _bab =0x9b25;func (_cce *Encoder )WriteTo (w _a .Writer )(int64 ,error ){const _ecd ="\u0045n\u0063o\u0064\u0065\u0072\u002e\u0057\u0072\u0069\u0074\u0065\u0054\u006f";var _agbc int64 ;for _egc ,_bef :=range _cce ._gd {_ea ,_geg :=w .Write (_bef );if _geg !=nil {return 0,_c .Wrapf (_geg ,_ecd ,"\u0066\u0061\u0069\u006c\u0065\u0064\u0020\u0061\u0074\u0020\u0069'\u0074\u0068\u003a\u0020\u0027\u0025\u0064\u0027\u0020\u0063h\u0075\u006e\u006b",_egc );};_agbc +=int64 (_ea );};_cce ._fd =_cce ._fd [:_cce ._ge ];_baf ,_cfb :=w .Write (_cce ._fd );if _cfb !=nil {return 0,_c .Wrap (_cfb ,_ecd ,"\u0062u\u0066f\u0065\u0072\u0065\u0064\u0020\u0063\u0068\u0075\u006e\u006b\u0073");};_agbc +=int64 (_baf );return _agbc ,nil ;};type Encoder struct{_agb uint32 ;_cd uint16 ;_dg ,_fba uint8 ;_eb int ;_af int ;_gd [][]byte ;_fd []byte ;_ge int ;_gb *codingContext ;_cg [13]*codingContext ;_aag *codingContext ;};func (_ff *Encoder )DataSize ()int {return _ff .dataSize ()};func (_aafa *Encoder )byteOut (){if _aafa ._fba ==0xff{_aafa .rBlock ();return ;};if _aafa ._agb < 0x8000000{_aafa .lBlock ();return ;};_aafa ._fba ++;if _aafa ._fba !=0xff{_aafa .lBlock ();return ;};_aafa ._agb &=0x7ffffff;_aafa .rBlock ();};func New ()*Encoder {_ba :=&Encoder {};_ba .Init ();return _ba };func (_cfg *Encoder )flush (){_cfg .setBits ();_cfg ._agb <<=_cfg ._dg ;_cfg .byteOut ();_cfg ._agb <<=_cfg ._dg ;_cfg .byteOut ();_cfg .emit ();if _cfg ._fba !=0xff{_cfg ._eb ++;_cfg ._fba =0xff;_cfg .emit ();};_cfg ._eb ++;_cfg ._fba =0xac;_cfg ._eb ++;_cfg .emit ();};func (_eaa *Encoder )code0 (_df *codingContext ,_dac uint32 ,_acd uint16 ,_ed byte ){if _df .mps (_dac )==0{_eaa .codeMPS (_df ,_dac ,_acd ,_ed );}else {_eaa .codeLPS (_df ,_dac ,_acd ,_ed );};};func (_ege *Encoder )rBlock (){if _ege ._eb >=0{_ege .emit ();};_ege ._eb ++;_ege ._fba =uint8 (_ege ._agb >>20);_ege ._agb &=0xfffff;_ege ._dg =7;};var _b =[]intEncRangeS {{0,3,0,2,0,2},{-1,-1,9,4,0,0},{-3,-2,5,3,2,1},{4,19,2,3,4,4},{-19,-4,3,3,4,4},{20,83,6,4,20,6},{-83,-20,7,4,20,6},{84,339,14,5,84,8},{-339,-84,15,5,84,8},{340,4435,30,6,340,12},{-4435,-340,31,6,340,12},{4436,2000000000,62,6,4436,32},{-2000000000,-4436,63,6,4436,32}};func (_cca *Encoder )encodeBit (_eag *codingContext ,_ece uint32 ,_cga uint8 )error {const _abd ="\u0045\u006e\u0063\u006f\u0064\u0065\u0072\u002e\u0065\u006e\u0063\u006fd\u0065\u0042\u0069\u0074";_cca ._af ++;if _ece >=uint32 (len (_eag ._fb )){return _c .Errorf (_abd ,"\u0061r\u0069\u0074h\u006d\u0065\u0074i\u0063\u0020\u0065\u006e\u0063\u006f\u0064e\u0072\u0020\u002d\u0020\u0069\u006ev\u0061\u006c\u0069\u0064\u0020\u0063\u0074\u0078\u0020\u006e\u0075m\u0062\u0065\u0072\u003a\u0020\u0027\u0025\u0064\u0027",_ece );};_ce :=_eag ._fb [_ece ];_aba :=_eag .mps (_ece );_gdb :=_dff [_ce ]._dae ;_ag .Log .Trace ("\u0045\u0043\u003a\u0020\u0025d\u0009\u0020D\u003a\u0020\u0025d\u0009\u0020\u0049\u003a\u0020\u0025d\u0009\u0020\u004dPS\u003a \u0025\u0064\u0009\u0020\u0051\u0045\u003a \u0025\u0030\u0034\u0058\u0009\u0020\u0020\u0041\u003a\u0020\u0025\u0030\u0034\u0058\u0009\u0020\u0043\u003a %\u0030\u0038\u0058\u0009\u0020\u0043\u0054\u003a\u0020\u0025\u0064\u0009\u0020\u0042\u003a\u0020\u0025\u0030\u0032\u0058\u0009\u0020\u0042\u0050\u003a\u0020\u0025\u0064",_cca ._af ,_cga ,_ce ,_aba ,_gdb ,_cca ._cd ,_cca ._agb ,_cca ._dg ,_cca ._fba ,_cca ._eb );if _cga ==0{_cca .code0 (_eag ,_ece ,_gdb ,_ce );}else {_cca .code1 (_eag ,_ece ,_gdb ,_ce );};return nil ;};func (_aafc *codingContext )mps (_ab uint32 )int {return int (_aafc ._dd [_ab ])};func (_aa Class )String ()string {switch _aa {case IAAI :return "\u0049\u0041\u0041\u0049";case IADH :return "\u0049\u0041\u0044\u0048";case IADS :return "\u0049\u0041\u0044\u0053";case IADT :return "\u0049\u0041\u0044\u0054";case IADW :return "\u0049\u0041\u0044\u0057";case IAEX :return "\u0049\u0041\u0045\u0058";case IAFS :return "\u0049\u0041\u0046\u0053";case IAIT :return "\u0049\u0041\u0049\u0054";case IARDH :return "\u0049\u0041\u0052D\u0048";case IARDW :return "\u0049\u0041\u0052D\u0057";case IARDX :return "\u0049\u0041\u0052D\u0058";case IARDY :return "\u0049\u0041\u0052D\u0059";case IARI :return "\u0049\u0041\u0052\u0049";default:return "\u0055N\u004b\u004e\u004f\u0057\u004e";};};func (_cad *Encoder )encodeOOB (_edd Class )error {_edc :=_cad ._cg [_edd ];_fge :=_cad .encodeBit (_edc ,1,1);if _fge !=nil {return _fge ;};_fge =_cad .encodeBit (_edc ,3,0);if _fge !=nil {return _fge ;};_fge =_cad .encodeBit (_edc ,6,0);if _fge !=nil {return _fge ;};_fge =_cad .encodeBit (_edc ,12,0);if _fge !=nil {return _fge ;};return nil ;};func (_cdb *Encoder )codeLPS (_dbed *codingContext ,_egd uint32 ,_bga uint16 ,_dba byte ){_cdb ._cd -=_bga ;if _cdb ._cd < _bga {_cdb ._agb +=uint32 (_bga );}else {_cdb ._cd =_bga ;};if _dff [_dba ]._gdbc ==1{_dbed .flipMps (_egd );};_dbed ._fb [_egd ]=_dff [_dba ]._beb ;_cdb .renormalize ();};func (_acf *Encoder )encodeIAID (_dbg ,_fe int )error {if _acf ._aag ==nil {_acf ._aag =_bd (1<<uint (_dbg ));};_bfb :=uint32 (1<<uint32 (_dbg +1))-1;_fe <<=uint (32-_dbg );_def :=uint32 (1);for _efe :=0;_efe < _dbg ;_efe ++{_gdc :=_def &_bfb ;_ga :=uint8 ((uint32 (_fe )&0x80000000)>>31);if _gec :=_acf .encodeBit (_acf ._aag ,_gdc ,_ga );_gec !=nil {return _gec ;};_def =(_def <<1)|uint32 (_ga );_fe <<=1;};return nil ;};const (IAAI Class =iota ;IADH ;IADS ;IADT ;IADW ;IAEX ;IAFS ;IAIT ;IARDH ;IARDW ;IARDX ;IARDY ;IARI ;);func (_gbf *Encoder )code1 (_fgcd *codingContext ,_cbd uint32 ,_bac uint16 ,_caa byte ){if _fgcd .mps (_cbd )==1{_gbf .codeMPS (_fgcd ,_cbd ,_bac ,_caa );}else {_gbf .codeLPS (_fgcd ,_cbd ,_bac ,_caa );};};func (_dgg *Encoder )Init (){_dgg ._gb =_bd (_efc );_dgg ._cd =0x8000;_dgg ._agb =0;_dgg ._dg =12;_dgg ._eb =-1;_dgg ._fba =0;_dgg ._ge =0;_dgg ._fd =make ([]byte ,_cff );for _ddd :=0;_ddd < len (_dgg ._cg );_ddd ++{_dgg ._cg [_ddd ]=_bd (512);};_dgg ._aag =nil ;};type intEncRangeS struct{_ae ,_aae int ;_aaf ,_f uint8 ;_e uint16 ;_fg uint8 ;};type state struct{_dae uint16 ;_dgc ,_beb uint8 ;_gdbc uint8 ;};func (_fbf *Encoder )Refine (iTemp ,iTarget *_g .Bitmap ,ox ,oy int )error {for _ec :=0;_ec < iTarget .Height ;_ec ++{var _gcg int ;_cag :=_ec +oy ;var (_abb ,_deg ,_ee ,_cdg ,_aegd uint16 ;_acc ,_efa ,_fgc ,_bb ,_cgd byte ;);if _cag >=1&&(_cag -1)< iTemp .Height {_acc =iTemp .Data [(_cag -1)*iTemp .RowStride ];};if _cag >=0&&_cag < iTemp .Height {_efa =iTemp .Data [_cag *iTemp .RowStride ];};if _cag >=-1&&_cag +1< iTemp .Height {_fgc =iTemp .Data [(_cag +1)*iTemp .RowStride ];};if _ec >=1{_bb =iTarget .Data [(_ec -1)*iTarget .RowStride ];};_cgd =iTarget .Data [_ec *iTarget .RowStride ];_cgc :=uint (6+ox );_abb =uint16 (_acc >>_cgc );_deg =uint16 (_efa >>_cgc );_ee =uint16 (_fgc >>_cgc );_cdg =uint16 (_bb >>6);_cf :=uint (2-ox );_acc <<=_cf ;_efa <<=_cf ;_fgc <<=_cf ;_bb <<=2;for _gcg =0;_gcg < iTarget .Width ;_gcg ++{_adf :=(_abb <<10)|(_deg <<7)|(_ee <<4)|(_cdg <<1)|_aegd ;_ace :=_cgd >>7;_fgg :=_fbf .encodeBit (_fbf ._gb ,uint32 (_adf ),_ace );if _fgg !=nil {return _fgg ;};_abb <<=1;_deg <<=1;_ee <<=1;_cdg <<=1;_abb |=uint16 (_acc >>7);_deg |=uint16 (_efa >>7);_ee |=uint16 (_fgc >>7);_cdg |=uint16 (_bb >>7);_aegd =uint16 (_ace );_dga :=_gcg %8;_bf :=_gcg /8+1;if _dga ==5+ox {_acc ,_efa ,_fgc =0,0,0;if _bf < iTemp .RowStride &&_cag >=1&&(_cag -1)< iTemp .Height {_acc =iTemp .Data [(_cag -1)*iTemp .RowStride +_bf ];};if _bf < iTemp .RowStride &&_cag >=0&&_cag < iTemp .Height {_efa =iTemp .Data [_cag *iTemp .RowStride +_bf ];};if _bf < iTemp .RowStride &&_cag >=-1&&(_cag +1)< iTemp .Height {_fgc =iTemp .Data [(_cag +1)*iTemp .RowStride +_bf ];};}else {_acc <<=1;_efa <<=1;_fgc <<=1;};if _dga ==5&&_ec >=1{_bb =0;if _bf < iTarget .RowStride {_bb =iTarget .Data [(_ec -1)*iTarget .RowStride +_bf ];};}else {_bb <<=1;};if _dga ==7{_cgd =0;if _bf < iTarget .RowStride {_cgd =iTarget .Data [_ec *iTarget .RowStride +_bf ];};}else {_cgd <<=1;};_abb &=7;_deg &=7;_ee &=7;_cdg &=7;};};return nil ;};func (_dbd *Encoder )setBits (){_gdf :=_dbd ._agb +uint32 (_dbd ._cd );_dbd ._agb |=0xffff;if _dbd ._agb >=_gdf {_dbd ._agb -=0x8000;};};type Class int ;func (_ada *Encoder )Final (){_ada .flush ()};func (_abc *Encoder )EncodeOOB (proc Class )(_aeg error ){_ag .Log .Trace ("E\u006e\u0063\u006f\u0064\u0065\u0020O\u004f\u0042\u0020\u0077\u0069\u0074\u0068\u0020\u0043l\u0061\u0073\u0073:\u0020'\u0025\u0073\u0027",proc );if _aeg =_abc .encodeOOB (proc );_aeg !=nil {return _c .Wrap (_aeg ,"\u0045n\u0063\u006f\u0064\u0065\u004f\u004fB","");};return nil ;};func (_gegf *Encoder )encodeInteger (_beae Class ,_geb int )error {const _abag ="E\u006e\u0063\u006f\u0064er\u002ee\u006e\u0063\u006f\u0064\u0065I\u006e\u0074\u0065\u0067\u0065\u0072";if _geb > 2000000000||_geb < -2000000000{return _c .Errorf (_abag ,"\u0061\u0072\u0069\u0074\u0068\u006d\u0065\u0074i\u0063\u0020\u0065nc\u006f\u0064\u0065\u0072\u0020\u002d \u0069\u006e\u0076\u0061\u006c\u0069\u0064\u0020\u0069\u006e\u0074\u0065\u0067\u0065\u0072 \u0076\u0061\u006c\u0075\u0065\u003a\u0020\u0027%\u0064\u0027",_geb );};_daa :=_gegf ._cg [_beae ];_ade :=uint32 (1);var _gbd int ;for ;;_gbd ++{if _b [_gbd ]._ae <=_geb &&_b [_gbd ]._aae >=_geb {break ;};};if _geb < 0{_geb =-_geb ;};_geb -=int (_b [_gbd ]._e );_acg :=_b [_gbd ]._aaf ;for _fbb :=uint8 (0);_fbb < _b [_gbd ]._f ;_fbb ++{_aff :=_acg &1;if _ccc :=_gegf .encodeBit (_daa ,_ade ,_aff );_ccc !=nil {return _c .Wrap (_ccc ,_abag ,"");};_acg >>=1;if _ade &0x100> 0{_ade =(((_ade <<1)|uint32 (_aff ))&0x1ff)|0x100;}else {_ade =(_ade <<1)|uint32 (_aff );};};_geb <<=32-_b [_gbd ]._fg ;for _fgf :=uint8 (0);_fgf < _b [_gbd ]._fg ;_fgf ++{_gba :=uint8 ((uint32 (_geb )&0x80000000)>>31);if _fa :=_gegf .encodeBit (_daa ,_ade ,_gba );_fa !=nil {return _c .Wrap (_fa ,_abag ,"\u006d\u006f\u0076\u0065 \u0064\u0061\u0074\u0061\u0020\u0074\u006f\u0020\u0074\u0068e\u0020t\u006f\u0070\u0020\u006f\u0066\u0020\u0077o\u0072\u0064");};_geb <<=1;if _ade &0x100!=0{_ade =(((_ade <<1)|uint32 (_gba ))&0x1ff)|0x100;}else {_ade =(_ade <<1)|uint32 (_gba );};};return nil ;};func (_cb *Encoder )Flush (){_cb ._ge =0;_cb ._gd =nil ;_cb ._eb =-1};var _ _a .WriterTo =&Encoder {};func (_bc *codingContext )flipMps (_agf uint32 ){_bc ._dd [_agf ]=1-_bc ._dd [_agf ]};func (_ecb *Encoder )dataSize ()int {return _cff *len (_ecb ._gd )+_ecb ._ge };func (_bdb *Encoder )EncodeIAID (symbolCodeLength ,value int )(_gda error ){_ag .Log .Trace ("\u0045\u006e\u0063\u006f\u0064\u0065\u0020\u0049A\u0049\u0044\u002e S\u0079\u006d\u0062\u006f\u006c\u0043o\u0064\u0065\u004c\u0065\u006e\u0067\u0074\u0068\u003a\u0020\u0027\u0025\u0064\u0027\u002c \u0056\u0061\u006c\u0075\u0065\u003a\u0020\u0027%\u0064\u0027",symbolCodeLength ,value );if _gda =_bdb .encodeIAID (symbolCodeLength ,value );_gda !=nil {return _c .Wrap (_gda ,"\u0045\u006e\u0063\u006f\u0064\u0065\u0049\u0041\u0049\u0044","");};return nil ;};