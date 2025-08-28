Shader "Hidden/TerrainEngine/Details/BillboardWavingDoublePass" {
Properties {
 _WavingTint ("Fade Color", Color) = (0.7,0.6,0.5,0)
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
 _WaveAndDistance ("Wave and distance", Vector) = (12,3.6,1,1)
 _Cutoff ("Cutoff", Float) = 0.5
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  Cull Off
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_WavingTint]
Vector 18 [_WaveAndDistance]
Vector 19 [_CameraPosition]
Vector 20 [_CameraRight]
Vector 21 [_CameraUp]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[30] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..22],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[19];
DP3 R0.x, R0, R0;
SLT R0.x, c[18].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[20], vertex.position;
MAD R3.xyz, R0.y, c[21], R1;
MUL R0.x, R3.z, c[18].y;
MUL R1.xyz, R0.x, c[24];
MUL R0.x, R3, c[18].y;
MAD R1, R0.x, c[23], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[18].x, R1;
FRC R0, R0;
MUL R0, R0, c[24].w;
ADD R0, R0, -c[25].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[25].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[25].z, R0;
MAD R0, R1, c[25].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[28].xxyz;
DP4 R2.x, R1, c[27];
DP4 R2.y, R1, c[26];
MAD R1.xz, -R2.xyyw, c[18].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R2.xyz, R1, -c[19];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[18].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MUL R2.x, R2, c[19].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[29].x;
MOV R1.x, c[28].w;
ADD R1.xyz, -R1.x, c[17];
MAD R0.xyz, R0.x, R1, c[28].w;
MUL R1.xyz, vertex.normal, c[16].w;
MUL R0.xyz, R0, vertex.color;
DP3 R3.w, R1, c[6];
MUL result.color.xyz, R0, c[0].y;
DP3 R2.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MOV R0.w, c[29].x;
MAX result.color.w, R1, c[29].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[14];
DP4 R3.y, R1, c[13];
DP4 R3.x, R1, c[12];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[15];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_SHAr]
Vector 9 [unity_SHAg]
Vector 10 [unity_SHAb]
Vector 11 [unity_SHBr]
Vector 12 [unity_SHBg]
Vector 13 [unity_SHBb]
Vector 14 [unity_SHC]
Vector 15 [unity_Scale]
Vector 16 [_WavingTint]
Vector 17 [_WaveAndDistance]
Vector 18 [_CameraPosition]
Vector 19 [_CameraRight]
Vector 20 [_CameraUp]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c23, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c24, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c25, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c26, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c27, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c28, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c29, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c18
dp3 r0.x, r0, r0
slt r0.x, c17.w, r0
max r0.x, -r0, r0
slt r0.x, c22, r0
add r0.x, -r0, c22.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c19, v0
mad r3.xyz, r0.y, c20, r1
mul r0.x, r3.z, c17.y
mul r1.xyz, r0.x, c23
mul r0.x, r3, c17.y
mad r0, r0.x, c24, r1.xyyz
mov r1.x, c17
mad r0, c25, r1.x, r0
frc r0, r0
mad r0, r0, c22.z, c22.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c23.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c26.x, r0
mad r0, r1, c26.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c29.xxyz
dp4 r2.x, r1, c28
dp4 r2.y, r1, c27
mad r1.xz, -r2.xyyw, c17.z, r3
mov r1.y, r3
mov r1.w, v0
add r2.xyz, r1, -c18
dp3 r2.x, r2, r2
add r2.x, -r2, c17.w
mov r0.w, c22.y
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mul r2.x, r2, c18.w
mul r1.w, r2.x, c25.y
min r1.w, r1, c22.y
mov r1.xyz, c16
add r1.xyz, c26.z, r1
mad r0.xyz, r0.x, r1, c26.w
mul r1.xyz, v2, c15.w
mul r0.xyz, r0, v5
dp3 r3.w, r1, c5
mul oD0.xyz, r0, c25.y
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
max oD0.w, r1, c22.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c10
dp4 r2.y, r0, c9
dp4 r2.x, r0, c8
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c13
dp4 r3.y, r1, c12
dp4 r3.x, r1, c11
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c14
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v3, c21, c21.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedngaljaekohmejikoioollhfbananplnnabaaaaaafiakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcliaiaaaa
eaaaabaacoacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaabaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefieceddgmhdegfdnhpomfcbanpkohklpmencgkabaaaaaababaaaaaaeaaaaaa
daaaaaaaoeafaaaakeaoaaaagmapaaaaebgpgodjkmafaaaakmafaaaaaaacpopp
dmafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaadaaaaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafbhaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
biaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbjaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbkaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafblaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
bmaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbnaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejabdaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaamaaaaadaaaaabiabcaappkaaaaaaaiaaeaaaaaeaaaaadia
aaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiabeaajekaaaaajeja
aeaaaaaeaaaaahiaaaaaffiabfaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiia
bcaaffkaafaaaaadacaaapiaabaaffiabgaajekaaeaaaaaeabaaapiaabaaaaia
bkaaoekaacaaoeiaabaaaaacacaaabiabcaaaakaaeaaaaaeabaaapiaacaaaaia
bhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
biaaaakabiaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapia
abaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiabgaappkaabaaoeiaafaaaaad
adaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaae
abaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiabiaappka
abaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeia
abaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeia
bjaajakaafaaaaadaaaaaiiaaaaappiabjaappkaajaaaaadabaaabiaacaaoeia
blaaoekaajaaaaadabaaaeiaacaaoeiabmaaoekaaeaaaaaeaaaaafiaabaaoeia
bcaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaakaaoekaaeaaaaaeabaaapia
ajaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaalaaoekaaaaakkiaabaaoeia
acaaaaadaaaaahiaaaaaoeiabdaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeia
acaaaaadaaaaabiaaaaaaaibbcaappkaafaaaaadaaaaabiaaaaaaaiabdaappka
acaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabiaaaaaaaiabnaakkka
akaaaaadabaaaioaaaaaaaiabnaappkaaeaaaaaeabaaapiaamaaoekaaaaappja
abaaoeiaabaaaaacaaaaabiabnaaaakaacaaaaadaaaaahiaaaaaaaiabbaaoeka
aeaaaaaeaaaaahiaaaaappiaaaaaoeiabnaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaacaaoejabaaappkaafaaaaadacaaahia
aaaaffiaaoaaoekaaeaaaaaeaaaaaliaanaakekaaaaaaaiaacaakeiaaeaaaaae
aaaaahiaapaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabnaappkaajaaaaad
acaaabiaacaaoekaaaaaoeiaajaaaaadacaaaciaadaaoekaaaaaoeiaajaaaaad
acaaaeiaaeaaoekaaaaaoeiaafaaaaadadaaapiaaaaacjiaaaaakeiaajaaaaad
aeaaabiaafaaoekaadaaoeiaajaaaaadaeaaaciaagaaoekaadaaoeiaajaaaaad
aeaaaeiaahaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaad
aaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappib
abaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaaiaaoekaaaaappiaacaaoeia
aeaaaaaeaaaaadmaabaappiaaaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeia
ppppaaaafdeieefcliaiaaaaeaaaabaacoacaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_CameraRight]
Vector 13 [_CameraUp]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..15],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[11];
DP3 R0.x, R0, R0;
SLT R0.x, c[10].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[12], vertex.position;
MAD R3.xyz, R0.y, c[13], R1;
MUL R0.x, R3.z, c[10].y;
MUL R1.xyz, R0.x, c[17];
MUL R0.x, R3, c[10].y;
MAD R1, R0.x, c[16], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[10].x, R1;
FRC R0, R0;
MUL R0, R0, c[17].w;
ADD R0, R0, -c[18].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[18].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[18].z, R0;
MAD R0, R1, c[18].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[20];
DP4 R2.y, R1, c[19];
MAD R1.xz, -R2.xyyw, c[10].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R2.xyz, R1, -c[11];
DP3 R2.x, R2, R2;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R2.x, -R2, c[10].w;
MUL R1.y, R2.x, c[11].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[21].xxyz;
MOV R1.x, c[21].w;
ADD R1.xyz, -R1.x, c[9];
MAD R0.xyz, R0.x, R1, c[21].w;
MIN R0.w, R1, c[22].x;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R0, c[22].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[14], c[14].zwzw;
END
# 49 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_WavingTint]
Vector 9 [_WaveAndDistance]
Vector 10 [_CameraPosition]
Vector 11 [_CameraRight]
Vector 12 [_CameraUp]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c16, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c17, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c18, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c19, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c20, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c21, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c22, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c10
dp3 r0.x, r0, r0
slt r0.x, c9.w, r0
max r0.x, -r0, r0
slt r0.x, c15, r0
add r0.x, -r0, c15.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c11, v0
mad r3.xyz, r0.y, c12, r1
mul r0.x, r3.z, c9.y
mul r1.xyz, r0.x, c16
mul r0.x, r3, c9.y
mad r0, r0.x, c17, r1.xyyz
mov r1.x, c9
mad r0, c18, r1.x, r0
frc r0, r0
mad r0, r0, c15.z, c15.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c16.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c19.x, r0
mad r0, r1, c19.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c21
dp4 r2.y, r1, c20
mad r1.xz, -r2.xyyw, c9.z, r3
mov r1.y, r3
mov r1.w, v0
add r2.xyz, r1, -c10
dp3 r2.x, r2, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
add r2.x, -r2, c9.w
mul r1.w, r2.x, c10
mov r1.xyz, c8
dp4 r0.x, r0, c22.xxyz
mul r1.w, r1, c18.y
add r1.xyz, c19.z, r1
mad r0.xyz, r0.x, r1, c19.w
min r0.w, r1, c15.y
mul r0.xyz, r0, v5
max oD0.w, r0, c15.x
mul oD0.xyz, r0, c18.y
mad oT0.xy, v3, c14, c14.zwzw
mad oT1.xy, v4, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedpdhhmomdnfpjjcfkjapagibalbmobomjabaaaaaadeaiaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefckmagaaaaeaaaabaaklabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
acaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
acaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaacaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaacaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaacaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
agaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedhfojlkhaoiihfkidkimhbbfockgahnnoabaaaaaameamaaaaaeaaaaaa
daaaaaaalmaeaaaahaalaaaadiamaaaaebgpgodjieaeaaaaieaeaaaaaaacpopp
diaeaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaafaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaacaaaaaaafaaahaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafamaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafanaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafaoaaapka
ekbfmneanlapejmagfiiaidmehamfaljfbaaaaafapaaapkafnjicmdphnbdikdo
hnbdakdodddddddpfbaaaaafbaaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
fbaaaaafbbaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbcaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbdaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaacaaaaadaaaaahiaaaaaoejaajaaoekbaiaaaaadaaaaabiaaaaaoeia
aaaaoeiaamaaaaadaaaaabiaaiaappkaaaaaaaiaaeaaaaaeaaaaadiaaaaaaaia
abaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiaakaajekaaaaajejaaeaaaaae
aaaaahiaaaaaffiaalaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiiaaiaaffka
afaaaaadacaaapiaabaaffiaamaajekaaeaaaaaeabaaapiaabaaaaiabaaaoeka
acaaoeiaabaaaaacacaaabiaaiaaaakaaeaaaaaeabaaapiaacaaaaiaanaaoeka
abaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeiaaoaaaaka
aoaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapiaabaaoeia
acaaoeiaaeaaaaaeabaaapiaadaaoeiaamaappkaabaaoeiaafaaaaadadaaapia
acaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaaeabaaapia
adaaoeiaaoaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiaaoaappkaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeiaapaajaka
afaaaaadaaaaaiiaaaaappiaapaappkaajaaaaadabaaabiaacaaoeiabbaaoeka
ajaaaaadabaaaeiaacaaoeiabcaaoekaaeaaaaaeaaaaafiaabaaoeiaaiaakkkb
aaaaoeiaafaaaaadabaaapiaaaaaffiaaeaaoekaaeaaaaaeabaaapiaadaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaafaaoekaaaaakkiaabaaoeiaacaaaaad
aaaaahiaaaaaoeiaajaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaacaaaaad
aaaaabiaaaaaaaibaiaappkaafaaaaadaaaaabiaaaaaaaiaajaappkaacaaaaad
aaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabiaaaaaaaiabdaakkkaakaaaaad
abaaaioaaaaaaaiabdaappkaaeaaaaaeabaaapiaagaaoekaaaaappjaabaaoeia
abaaaaacaaaaabiabdaaaakaacaaaaadaaaaahiaaaaaaaiaahaaoekaaeaaaaae
aaaaahiaaaaappiaaaaaoeiabdaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeia
afaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
abaappiaaaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiappppaaaafdeieefc
kmagaaaaeaaaabaaklabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaacaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaacaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaacaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
acaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
acaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaacaaaaaaacaaaaaa
fgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_CameraRight]
Vector 13 [_CameraUp]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..15],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[11];
DP3 R0.x, R0, R0;
SLT R0.x, c[10].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[12], vertex.position;
MAD R3.xyz, R0.y, c[13], R1;
MUL R0.x, R3.z, c[10].y;
MUL R1.xyz, R0.x, c[17];
MUL R0.x, R3, c[10].y;
MAD R1, R0.x, c[16], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[10].x, R1;
FRC R0, R0;
MUL R0, R0, c[17].w;
ADD R0, R0, -c[18].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[18].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[18].z, R0;
MAD R0, R1, c[18].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[20];
DP4 R2.y, R1, c[19];
MAD R1.xz, -R2.xyyw, c[10].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R2.xyz, R1, -c[11];
DP3 R2.x, R2, R2;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R2.x, -R2, c[10].w;
MUL R1.y, R2.x, c[11].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[21].xxyz;
MOV R1.x, c[21].w;
ADD R1.xyz, -R1.x, c[9];
MAD R0.xyz, R0.x, R1, c[21].w;
MIN R0.w, R1, c[22].x;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R0, c[22].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[14], c[14].zwzw;
END
# 49 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_WavingTint]
Vector 9 [_WaveAndDistance]
Vector 10 [_CameraPosition]
Vector 11 [_CameraRight]
Vector 12 [_CameraUp]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c16, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c17, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c18, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c19, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c20, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c21, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c22, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c10
dp3 r0.x, r0, r0
slt r0.x, c9.w, r0
max r0.x, -r0, r0
slt r0.x, c15, r0
add r0.x, -r0, c15.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c11, v0
mad r3.xyz, r0.y, c12, r1
mul r0.x, r3.z, c9.y
mul r1.xyz, r0.x, c16
mul r0.x, r3, c9.y
mad r0, r0.x, c17, r1.xyyz
mov r1.x, c9
mad r0, c18, r1.x, r0
frc r0, r0
mad r0, r0, c15.z, c15.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c16.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c19.x, r0
mad r0, r1, c19.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c21
dp4 r2.y, r1, c20
mad r1.xz, -r2.xyyw, c9.z, r3
mov r1.y, r3
mov r1.w, v0
add r2.xyz, r1, -c10
dp3 r2.x, r2, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
add r2.x, -r2, c9.w
mul r1.w, r2.x, c10
mov r1.xyz, c8
dp4 r0.x, r0, c22.xxyz
mul r1.w, r1, c18.y
add r1.xyz, c19.z, r1
mad r0.xyz, r0.x, r1, c19.w
min r0.w, r1, c15.y
mul r0.xyz, r0, v5
max oD0.w, r0, c15.x
mul oD0.xyz, r0, c18.y
mad oT0.xy, v3, c14, c14.zwzw
mad oT1.xy, v4, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedpdhhmomdnfpjjcfkjapagibalbmobomjabaaaaaadeaiaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefckmagaaaaeaaaabaaklabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
acaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
acaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaacaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaacaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaacaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
agaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedhfojlkhaoiihfkidkimhbbfockgahnnoabaaaaaameamaaaaaeaaaaaa
daaaaaaalmaeaaaahaalaaaadiamaaaaebgpgodjieaeaaaaieaeaaaaaaacpopp
diaeaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaafaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaacaaaaaaafaaahaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafamaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafanaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafaoaaapka
ekbfmneanlapejmagfiiaidmehamfaljfbaaaaafapaaapkafnjicmdphnbdikdo
hnbdakdodddddddpfbaaaaafbaaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
fbaaaaafbbaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbcaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbdaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaacaaaaadaaaaahiaaaaaoejaajaaoekbaiaaaaadaaaaabiaaaaaoeia
aaaaoeiaamaaaaadaaaaabiaaiaappkaaaaaaaiaaeaaaaaeaaaaadiaaaaaaaia
abaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiaakaajekaaaaajejaaeaaaaae
aaaaahiaaaaaffiaalaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiiaaiaaffka
afaaaaadacaaapiaabaaffiaamaajekaaeaaaaaeabaaapiaabaaaaiabaaaoeka
acaaoeiaabaaaaacacaaabiaaiaaaakaaeaaaaaeabaaapiaacaaaaiaanaaoeka
abaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeiaaoaaaaka
aoaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapiaabaaoeia
acaaoeiaaeaaaaaeabaaapiaadaaoeiaamaappkaabaaoeiaafaaaaadadaaapia
acaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaaeabaaapia
adaaoeiaaoaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiaaoaappkaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeiaapaajaka
afaaaaadaaaaaiiaaaaappiaapaappkaajaaaaadabaaabiaacaaoeiabbaaoeka
ajaaaaadabaaaeiaacaaoeiabcaaoekaaeaaaaaeaaaaafiaabaaoeiaaiaakkkb
aaaaoeiaafaaaaadabaaapiaaaaaffiaaeaaoekaaeaaaaaeabaaapiaadaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaafaaoekaaaaakkiaabaaoeiaacaaaaad
aaaaahiaaaaaoeiaajaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaacaaaaad
aaaaabiaaaaaaaibaiaappkaafaaaaadaaaaabiaaaaaaaiaajaappkaacaaaaad
aaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabiaaaaaaaiabdaakkkaakaaaaad
abaaaioaaaaaaaiabdaappkaaeaaaaaeabaaapiaagaaoekaaaaappjaabaaoeia
abaaaaacaaaaabiabdaaaakaacaaaaadaaaaahiaaaaaaaiaahaaoekaaeaaaaae
aaaaahiaaaaappiaaaaaoeiabdaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeia
afaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
abaappiaaaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiappppaaaafdeieefc
kmagaaaaeaaaabaaklabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaacaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaacaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaacaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
acaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
acaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaacaaaaaaacaaaaaa
fgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..23],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.xyz, vertex.position, -c[20];
DP3 R0.x, R0, R0;
SLT R0.x, c[19].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[21], vertex.position;
MAD R3.xyz, R0.y, c[22], R1;
MUL R0.x, R3.z, c[19].y;
MUL R1.xyz, R0.x, c[25];
MUL R0.x, R3, c[19].y;
MAD R1, R0.x, c[24], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
FRC R0, R0;
MUL R0, R0, c[25].w;
ADD R1, R0, -c[26].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[26].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[26].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[26].y, R1;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[29].xxyz;
DP4 R2.x, R1, c[28];
DP4 R2.y, R1, c[27];
MAD R1.xz, -R2.xyyw, c[19].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R3.xyz, R1, -c[20];
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
DP3 R3.x, R3, R3;
MUL R4.xyz, R2.xyww, c[29].w;
ADD R1.x, -R3, c[19].w;
MUL R1.x, R1, c[20].w;
MUL R1.y, R1.x, c[0];
MIN R1.w, R1.y, c[30].x;
MUL R4.y, R4, c[9].x;
MOV R1.x, c[29].w;
ADD R1.xyz, -R1.x, c[18];
MAD R0.xyz, R0.x, R1, c[29].w;
MUL R0.xyz, R0, vertex.color;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.color.xyz, R0, c[0].y;
DP3 R3.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV result.position, R2;
MOV result.texcoord[3].zw, R2;
DP3 R2.w, R1, c[6];
MOV R0.y, R2.w;
MOV R0.z, R3.w;
MOV R0.w, c[30].x;
MAX result.color.w, R1, c[30].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[16];
ADD R2.xyz, R2, R3;
ADD result.texcoord[3].xy, R4, R4.z;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R2.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 75 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c25, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c26, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c27, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c28, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c29, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c30, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c31, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c20
dp3 r0.x, r0, r0
slt r0.x, c19.w, r0
max r0.x, -r0, r0
slt r0.x, c24, r0
add r0.x, -r0, c24.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c21, v0
mad r3.xyz, r0.y, c22, r1
mul r0.x, r3.z, c19.y
mul r1.xyz, r0.x, c25
mul r0.x, r3, c19.y
mad r1, r0.x, c26, r1.xyyz
mov r0.x, c19
mad r0, c27, r0.x, r1
frc r0, r0
mad r1, r0, c24.z, c24.w
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c25.w, r1
mul r2, r2, r0
mad r1, r2, c28.x, r1
mul r0, r2, r0
mad r0, r0, c28.y, r1
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c31.xxyz
dp4 r2.x, r1, c30
dp4 r2.y, r1, c29
mad r1.xz, -r2.xyyw, c19.z, r3
mov r1.y, r3
mov r1.w, v0
add r3.xyz, r1, -c20
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp3 r3.x, r3, r3
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r4.xyz, r2.xyww, c28.w
add r1.x, -r3, c19.w
mul r1.x, r1, c20.w
mul r1.w, r1.x, c27.y
min r1.w, r1, c24.y
mul r4.y, r4, c8.x
mov r1.xyz, c18
add r1.xyz, c28.z, r1
mad r0.xyz, r0.x, r1, c28.w
mul r0.xyz, r0, v5
mul r1.xyz, v2, c17.w
mul oD0.xyz, r0, c27.y
dp3 r3.w, r1, c6
dp3 r0.x, r1, c4
mov oPos, r2
mov oT3.zw, r2
dp3 r2.w, r1, c5
mov r0.y, r2.w
mov r0.z, r3.w
mov r0.w, c24.y
max oD0.w, r1, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c16
add r2.xyz, r2, r3
mad oT3.xy, r4.z, c9.zwzw, r4
add oT2.xyz, r2, r1
mov oT1.z, r3.w
mov oT1.y, r2.w
mov oT1.x, r0
mad oT0.xy, v3, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecediecafehjemhgpacejdioiopkilplmlffabaaaaaadealaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefchmajaaaaeaaaabaafpacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
aeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaa
pgipcaaaaeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaaeaaaaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaafaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedllaamgaplkkccfbgbfflbipjpfacjlhdabaaaaaadebbaaaaaeaaaaaa
daaaaaaacmagaaaalaapaaaahibaaaaaebgpgodjpeafaaaapeafaaaaaaacpopp
hiafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaajaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaafaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbiaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbjaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbkaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafblaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbmaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafbnaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafboaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
beaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabdaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabfaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabgaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabdaaffkaafaaaaadacaaapiaabaaffiabjaajeka
aeaaaaaeabaaapiaabaaaaiablaaoekaacaaoeiaabaaaaacacaaabiabdaaaaka
aeaaaaaeabaaapiaacaaaaiabhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabiaaaakabiaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bjaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabiaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabkaajakaafaaaaadaaaaaiiaaaaappiabkaappka
ajaaaaadabaaabiaacaaoeiabmaaoekaajaaaaadabaaaeiaacaaoeiabnaaoeka
aeaaaaaeaaaaafiaabaaoeiabdaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffia
alaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapia
amaaoekaaaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiabeaaoekbaiaaaaad
aaaaabiaaaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibbdaappkaafaaaaad
aaaaabiaaaaaaaiabeaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaad
aaaaabiaaaaaaaiaboaakkkaakaaaaadabaaaioaaaaaaaiaboaappkaaeaaaaae
abaaapiaanaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaboaaaakaacaaaaad
aaaaahiaaaaaaaiabcaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaboaaffka
acaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoeja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoeja
bbaappkaafaaaaadacaaahiaaaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakeka
aaaaaaiaacaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiaboaappkaajaaaaadacaaabiaadaaoekaaaaaoeiaajaaaaadacaaacia
aeaaoekaaaaaoeiaajaaaaadacaaaeiaafaaoekaaaaaoeiaafaaaaadadaaapia
aaaacjiaaaaakeiaajaaaaadaeaaabiaagaaoekaadaaoeiaajaaaaadaeaaacia
ahaaoekaadaaoeiaajaaaaadaeaaaeiaaiaaoekaadaaoeiaacaaaaadacaaahia
acaaoeiaaeaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiia
aaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoa
ajaaoekaaaaappiaacaaoeiaafaaaaadaaaaahiaabaapeiaboaaffkaafaaaaad
aaaaaiiaaaaaffiaacaaaakaacaaaaadaeaaadoaaaaakkiaaaaaomiaaeaaaaae
aaaaadmaabaappiaaaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaac
aeaaamoaabaaoeiappppaaaafdeieefchmajaaaaeaaaabaafpacaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaae
egiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
hcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaai
bcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaam
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaap
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaaeaaaaaa
abaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaaeaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaafaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 9 [_ProjectionParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[12];
DP3 R0.x, R0, R0;
SLT R0.x, c[11].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[13], vertex.position;
MAD R3.xyz, R0.y, c[14], R1;
MUL R0.x, R3.z, c[11].y;
MUL R1.xyz, R0.x, c[18];
MUL R0.x, R3, c[11].y;
MAD R1, R0.x, c[17], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[18].w;
ADD R0, R0, -c[19].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[19].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[19].z, R0;
MAD R0, R1, c[19].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[21];
DP4 R2.y, R1, c[20];
MAD R1.xz, -R2.xyyw, c[11].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[22].w;
MUL R3.y, R3, c[9].x;
ADD result.texcoord[2].xy, R3, R3.z;
ADD R3.xyz, R1, -c[12];
DP3 R1.x, R3, R3;
ADD R1.x, -R1, c[11].w;
MUL R1.y, R1.x, c[12].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[22].xxyz;
MOV R1.x, c[22].w;
ADD R1.xyz, -R1.x, c[10];
MAD R0.xyz, R0.x, R1, c[22].w;
MIN R0.w, R1, c[23].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MOV result.texcoord[2].zw, R2;
MAX result.color.w, R0, c[23].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c12
dp3 r0.x, r0, r0
slt r0.x, c11.w, r0
max r0.x, -r0, r0
slt r0.x, c17, r0
add r0.x, -r0, c17.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c13, v0
mad r3.xyz, r0.y, c14, r1
mul r0.x, r3.z, c11.y
mul r1.xyz, r0.x, c18
mul r0.x, r3, c11.y
mad r0, r0.x, c19, r1.xyyz
mov r1.x, c11
mad r0, c20, r1.x, r0
frc r0, r0
mad r0, r0, c17.z, c17.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.x, r0
mad r0, r1, c21.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c23
dp4 r2.y, r1, c22
mad r1.xz, -r2.xyyw, c11.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r3.xyz, r2.xyww, c21.w
mul r3.y, r3, c8.x
mad oT2.xy, r3.z, c9.zwzw, r3
add r3.xyz, r1, -c12
dp3 r1.x, r3, r3
add r1.x, -r1, c11.w
mul r1.w, r1.x, c12
mov r1.xyz, c10
dp4 r0.x, r0, c24.xxyz
mul r1.w, r1, c20.y
add r1.xyz, c21.z, r1
mad r0.xyz, r0.x, r1, c21.w
min r0.w, r1, c17.y
mul r0.xyz, r0, v5
mov oPos, r2
mov oT2.zw, r2
max oD0.w, r0, c17.x
mul oD0.xyz, r0, c20.y
mad oT0.xy, v3, c16, c16.zwzw
mad oT1.xy, v4, c15, c15.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedpfbbakbfajpbolaekfmecegihpeolmckabaaaaaabaajaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchaahaaaa
eaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaa
ajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedchnihgjfdlonkcldjpdjimodjoibonkpabaaaaaaoianaaaaaeaaaaaa
daaaaaaaaeafaaaahmamaaaaeeanaaaaebgpgodjmmaeaaaammaeaaaaaaacpopp
heaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaajaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpfbaaaaafaoaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafapaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
baaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbbaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbcaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafbdaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
beaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaakaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaajaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
alaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaamaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiaajaaffkaafaaaaadacaaapiaabaaffiaaoaajekaaeaaaaae
abaaapiaabaaaaiabcaaoekaacaaoeiaabaaaaacacaaabiaajaaaakaaeaaaaae
abaaapiaacaaaaiaapaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiabaaaaakabaaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiaaoaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiabaaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiabaaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiabbaajakaafaaaaadaaaaaiiaaaaappiabbaappkaajaaaaad
abaaabiaacaaoeiabdaaoekaajaaaaadabaaaeiaacaaoeiabeaaoekaaeaaaaae
aaaaafiaabaaoeiaajaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaafaaoeka
aeaaaaaeabaaapiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaagaaoeka
aaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaakaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibajaappkaafaaaaadaaaaabia
aaaaaaiaakaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabia
aaaaaaiaanaakkkaakaaaaadabaaaioaaaaaaaiaanaappkaaeaaaaaeabaaapia
ahaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaanaaaakaacaaaaadaaaaahia
aaaaaaiaaiaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaanaaffkaacaaaaad
aaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaahiaabaapeiaanaaffkaafaaaaadaaaaaiiaaaaaffia
adaaaakaacaaaaadacaaadoaaaaakkiaaaaaomiaaeaaaaaeaaaaadmaabaappia
aaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeia
ppppaaaafdeieefchaahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 9 [_ProjectionParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[12];
DP3 R0.x, R0, R0;
SLT R0.x, c[11].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[13], vertex.position;
MAD R3.xyz, R0.y, c[14], R1;
MUL R0.x, R3.z, c[11].y;
MUL R1.xyz, R0.x, c[18];
MUL R0.x, R3, c[11].y;
MAD R1, R0.x, c[17], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[18].w;
ADD R0, R0, -c[19].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[19].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[19].z, R0;
MAD R0, R1, c[19].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[21];
DP4 R2.y, R1, c[20];
MAD R1.xz, -R2.xyyw, c[11].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[22].w;
MUL R3.y, R3, c[9].x;
ADD result.texcoord[2].xy, R3, R3.z;
ADD R3.xyz, R1, -c[12];
DP3 R1.x, R3, R3;
ADD R1.x, -R1, c[11].w;
MUL R1.y, R1.x, c[12].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[22].xxyz;
MOV R1.x, c[22].w;
ADD R1.xyz, -R1.x, c[10];
MAD R0.xyz, R0.x, R1, c[22].w;
MIN R0.w, R1, c[23].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MOV result.texcoord[2].zw, R2;
MAX result.color.w, R0, c[23].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c12
dp3 r0.x, r0, r0
slt r0.x, c11.w, r0
max r0.x, -r0, r0
slt r0.x, c17, r0
add r0.x, -r0, c17.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c13, v0
mad r3.xyz, r0.y, c14, r1
mul r0.x, r3.z, c11.y
mul r1.xyz, r0.x, c18
mul r0.x, r3, c11.y
mad r0, r0.x, c19, r1.xyyz
mov r1.x, c11
mad r0, c20, r1.x, r0
frc r0, r0
mad r0, r0, c17.z, c17.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.x, r0
mad r0, r1, c21.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c23
dp4 r2.y, r1, c22
mad r1.xz, -r2.xyyw, c11.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r3.xyz, r2.xyww, c21.w
mul r3.y, r3, c8.x
mad oT2.xy, r3.z, c9.zwzw, r3
add r3.xyz, r1, -c12
dp3 r1.x, r3, r3
add r1.x, -r1, c11.w
mul r1.w, r1.x, c12
mov r1.xyz, c10
dp4 r0.x, r0, c24.xxyz
mul r1.w, r1, c20.y
add r1.xyz, c21.z, r1
mad r0.xyz, r0.x, r1, c21.w
min r0.w, r1, c17.y
mul r0.xyz, r0, v5
mov oPos, r2
mov oT2.zw, r2
max oD0.w, r0, c17.x
mul oD0.xyz, r0, c20.y
mad oT0.xy, v3, c16, c16.zwzw
mad oT1.xy, v4, c15, c15.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedpfbbakbfajpbolaekfmecegihpeolmckabaaaaaabaajaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchaahaaaa
eaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaa
ajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedchnihgjfdlonkcldjpdjimodjoibonkpabaaaaaaoianaaaaaeaaaaaa
daaaaaaaaeafaaaahmamaaaaeeanaaaaebgpgodjmmaeaaaammaeaaaaaaacpopp
heaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaajaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpfbaaaaafaoaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafapaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
baaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbbaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbcaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafbdaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
beaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaakaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaajaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
alaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaamaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiaajaaffkaafaaaaadacaaapiaabaaffiaaoaajekaaeaaaaae
abaaapiaabaaaaiabcaaoekaacaaoeiaabaaaaacacaaabiaajaaaakaaeaaaaae
abaaapiaacaaaaiaapaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiabaaaaakabaaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiaaoaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiabaaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiabaaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiabbaajakaafaaaaadaaaaaiiaaaaappiabbaappkaajaaaaad
abaaabiaacaaoeiabdaaoekaajaaaaadabaaaeiaacaaoeiabeaaoekaaeaaaaae
aaaaafiaabaaoeiaajaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaafaaoeka
aeaaaaaeabaaapiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaagaaoeka
aaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaakaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibajaappkaafaaaaadaaaaabia
aaaaaaiaakaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabia
aaaaaaiaanaakkkaakaaaaadabaaaioaaaaaaaiaanaappkaaeaaaaaeabaaapia
ahaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaanaaaakaacaaaaadaaaaahia
aaaaaaiaaiaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaanaaffkaacaaaaad
aaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaahiaabaapeiaanaaffkaafaaaaadaaaaaiiaaaaaffia
adaaaakaacaaaaadacaaadoaaaaakkiaaaaaomiaaeaaaaaeaaaaadmaabaappia
aaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeia
ppppaaaafdeieefchaahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
ajaaaaaakgiocaaaaaaaaaaaajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_4LightPosX0]
Vector 10 [unity_4LightPosY0]
Vector 11 [unity_4LightPosZ0]
Vector 12 [unity_4LightAtten0]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightColor2]
Vector 16 [unity_LightColor3]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_WavingTint]
Vector 26 [_WaveAndDistance]
Vector 27 [_CameraPosition]
Vector 28 [_CameraRight]
Vector 29 [_CameraUp]
Vector 30 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[38] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..30],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEMP R8;
MUL R7.xyz, vertex.normal, c[24].w;
DP3 R7.w, R7, c[6];
DP3 R8.x, R7, c[5];
ADD R0.xyz, vertex.position, -c[27];
DP3 R0.x, R0, R0;
SLT R0.x, c[26].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[28], vertex.position;
MAD R0.xyz, R0.y, c[29], R1;
MUL R0.w, R0.z, c[26].y;
MUL R1.xyz, R0.w, c[32];
MUL R0.w, R0.x, c[26].y;
MAD R2, R0.w, c[31], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[26].x, R2;
FRC R1, R1;
MUL R1, R1, c[32].w;
ADD R2, R1, -c[33].x;
MUL R1, R2, R2;
MUL R3, R1, R2;
MAD R2, R3, c[33].w, R2;
MUL R3, R3, R1;
MOV R8.y, R7.w;
MAD R2, R3, c[33].z, R2;
MUL R1, R3, R1;
MAD R1, R1, c[33].y, R2;
MUL R1, R1, R1;
MUL R2, R1, R1;
MUL R3, R2, vertex.attrib[14].y;
MOV R1.w, vertex.position;
DP4 R1.y, R3, c[34];
DP4 R1.x, R3, c[35];
MAD R1.xz, -R1.xyyw, c[26].z, R0;
MOV R1.y, R0;
DP4 R0.x, R1, c[6];
ADD R4, -R0.x, c[10];
MUL R0, R4, R4;
DP4 R3.x, R1, c[5];
ADD R3, -R3.x, c[9];
DP4 R6.x, R1, c[7];
MAD R5, R3, R3, R0;
ADD R0, -R6.x, c[11];
MAD R5, R0, R0, R5;
MUL R4, R7.w, R4;
MAD R3, R8.x, R3, R4;
DP3 R4.x, R7, c[7];
MAD R0, R4.x, R0, R3;
MUL R6, R5, c[12];
MOV R8.z, R4.x;
RSQ R3.x, R5.x;
MOV R8.w, c[37].x;
RSQ R3.y, R5.y;
RSQ R3.z, R5.z;
RSQ R3.w, R5.w;
MUL R0, R0, R3;
ADD R3, R6, c[37].x;
RCP R3.x, R3.x;
RCP R3.y, R3.y;
RCP R3.w, R3.w;
RCP R3.z, R3.z;
MAX R0, R0, c[37].y;
MUL R0, R0, R3;
MUL R3.xyz, R0.y, c[14];
MAD R3.xyz, R0.x, c[13], R3;
MAD R0.xyz, R0.z, c[15], R3;
MAD R3.xyz, R0.w, c[16], R0;
MUL R0, R8.xyzz, R8.yzzx;
MUL R3.w, R7, R7;
DP4 R6.z, R0, c[22];
DP4 R6.y, R0, c[21];
DP4 R6.x, R0, c[20];
MAD R3.w, R8.x, R8.x, -R3;
DP4 R5.z, R8, c[19];
DP4 R5.y, R8, c[18];
DP4 R5.x, R8, c[17];
MUL R0.xyz, R3.w, c[23];
ADD R5.xyz, R5, R6;
ADD R0.xyz, R5, R0;
ADD result.texcoord[2].xyz, R0, R3;
ADD R0.xyz, R1, -c[27];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[26].w;
MUL R0.y, R0.x, c[27].w;
MUL R0.w, R0.y, c[0].y;
MIN R0.w, R0, c[37].x;
MOV R0.x, c[36].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R1.xyz, -R0.x, c[25];
DP4 R0.x, R2, c[36].xxyz;
MAD R0.xyz, R0.x, R1, c[36].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R0, c[37].y;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].z, R4.x;
MOV result.texcoord[1].y, R7.w;
MOV result.texcoord[1].x, R8;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
END
# 100 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_4LightPosX0]
Vector 9 [unity_4LightPosY0]
Vector 10 [unity_4LightPosZ0]
Vector 11 [unity_4LightAtten0]
Vector 12 [unity_LightColor0]
Vector 13 [unity_LightColor1]
Vector 14 [unity_LightColor2]
Vector 15 [unity_LightColor3]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_WavingTint]
Vector 25 [_WaveAndDistance]
Vector 26 [_CameraPosition]
Vector 27 [_CameraRight]
Vector 28 [_CameraUp]
Vector 29 [_MainTex_ST]
"vs_2_0
def c30, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c31, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c32, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c33, 0.00600000, 0.02000000, 0.05000000, -0.00019841
def c34, 0.00833330, -0.16161616, -0.50000000, 0.50000000
def c35, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c36, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c37, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r7.xyz, v2, c23.w
dp3 r7.w, r7, c5
dp3 r8.x, r7, c4
add r0.xyz, v0, -c26
dp3 r0.x, r0, r0
slt r0.x, c25.w, r0
max r0.x, -r0, r0
slt r0.x, c31, r0
add r0.x, -r0, c31.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c27, v0
mad r0.xyz, r0.y, c28, r1
mul r0.w, r0.z, c25.y
mul r1.xyz, r0.w, c33
mul r0.w, r0.x, c25.y
mad r1, r0.w, c32, r1.xyyz
mov r0.w, c25.x
mad r1, c30, r0.w, r1
frc r1, r1
mad r2, r1, c31.z, c31.w
mul r1, r2, r2
mul r3, r1, r2
mad r2, r3, c34.y, r2
mul r3, r3, r1
mov r8.y, r7.w
mad r2, r3, c34.x, r2
mul r1, r3, r1
mad r1, r1, c33.w, r2
mul r1, r1, r1
mul r2, r1, r1
mul r3, r2, v1.y
mov r1.w, v0
dp4 r1.y, r3, c35
dp4 r1.x, r3, c36
mad r1.xz, -r1.xyyw, c25.z, r0
mov r1.y, r0
dp4 r0.x, r1, c5
add r4, -r0.x, c9
mul r0, r4, r4
dp4 r3.x, r1, c4
add r3, -r3.x, c8
dp4 r6.x, r1, c6
mad r5, r3, r3, r0
add r0, -r6.x, c10
mad r5, r0, r0, r5
mul r4, r7.w, r4
mad r3, r8.x, r3, r4
dp3 r4.x, r7, c6
mad r0, r4.x, r0, r3
mul r6, r5, c11
mov r8.z, r4.x
rsq r3.x, r5.x
mov r8.w, c31.y
rsq r3.y, r5.y
rsq r3.z, r5.z
rsq r3.w, r5.w
mul r0, r0, r3
add r3, r6, c31.y
rcp r3.x, r3.x
rcp r3.y, r3.y
rcp r3.w, r3.w
rcp r3.z, r3.z
max r0, r0, c31.x
mul r0, r0, r3
mul r3.xyz, r0.y, c13
mad r3.xyz, r0.x, c12, r3
mad r0.xyz, r0.z, c14, r3
mad r3.xyz, r0.w, c15, r0
mul r0, r8.xyzz, r8.yzzx
mul r3.w, r7, r7
dp4 r6.z, r0, c21
dp4 r6.y, r0, c20
dp4 r6.x, r0, c19
mad r3.w, r8.x, r8.x, -r3
dp4 r5.z, r8, c18
dp4 r5.y, r8, c17
dp4 r5.x, r8, c16
mul r0.xyz, r3.w, c22
add r5.xyz, r5, r6
add r0.xyz, r5, r0
add oT2.xyz, r0, r3
add r0.xyz, r1, -c26
dp3 r0.x, r0, r0
add r0.x, -r0, c25.w
mul r0.w, r0.x, c26
mul r0.w, r0, c30.y
min r0.w, r0, c31.y
mov r0.xyz, c24
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
add r1.xyz, c34.z, r0
dp4 r0.x, r2, c37.xxyz
mad r0.xyz, r0.x, r1, c34.w
mul r0.xyz, r0, v5
max oD0.w, r0, c31.x
mul oD0.xyz, r0, c30.y
mov oT1.z, r4.x
mov oT1.y, r7.w
mov oT1.x, r8
mad oT0.xy, v3, c29, c29.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedpeedafgjcaknjjlcfblafakmiblejiciabaaaaaakianaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcaiamaaaa
eaaaabaaacadaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacagaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaa
pgipcaaaadaaaaaaacaaaaaaagaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaaacaaaaaa
egacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaaagaabaiaebaaaaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegiocaaaabaaaaaaaeaaaaaadiaaaaahpcaabaaa
afaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaa
egaobaaaadaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaeaaaaaa
eeaaaaafpcaabaaaadaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
abaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedoleohlomkkbhbhjdgflglbhcfghanaefabaaaaaafibfaaaaaeaaaaaa
daaaaaaanmahaaaaombdaaaalebeaaaaebgpgodjkeahaaaakeahaaaaaaacpopp
ciahaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaacaaaiaaacaaaaaaaaaaabaacgaaahaaakaaaaaaaaaa
acaaaaaaaeaabbaaaaaaaaaaacaaamaaaeaabfaaaaaaaaaaacaabeaaabaabjaa
aaaaaaaaadaaaaaaafaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcaaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafcbaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafccaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafcdaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafceaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafcfaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafcgaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
bmaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiablaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabnaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaboaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiablaaffkaafaaaaadacaaapiaabaaffiacbaajeka
aeaaaaaeabaaapiaabaaaaiacdaaoekaacaaoeiaabaaaaacacaaabiablaaaaka
aeaaaaaeabaaapiaacaaaaiabpaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiacaaaaakacaaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
cbaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiacaaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiacaaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiaccaajakaafaaaaadaaaaaiiaaaaappiaccaappka
ajaaaaadabaaabiaacaaoeiaceaaoekaajaaaaadabaaaeiaacaaoeiacfaaoeka
aeaaaaaeaaaaafiaabaaoeiablaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeia
bmaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaib
blaappkaafaaaaadabaaabiaabaaaaiabmaappkaacaaaaadabaaabiaabaaaaia
abaaaaiaalaaaaadabaaabiaabaaaaiacgaakkkaakaaaaadabaaaioaabaaaaia
cgaappkaabaaaaacabaaajiacgaaoekaacaaaaadabaaahiaabaaaaiabkaaoeka
aeaaaaaeabaaahiaaaaappiaabaaoeiacgaaffkaacaaaaadabaaahiaabaaoeia
abaaoeiaafaaaaadabaaahoaabaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadabaaahiaaaaaffiabgaaoekaafaaaaadacaaapia
aaaaffiabcaaoekaaeaaaaaeacaaapiabbaaoekaaaaaaaiaacaaoeiaaeaaaaae
acaaapiabdaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiabeaaoekaaaaappja
acaaoeiaaeaaaaaeaaaaaliabfaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bhaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaahiabiaaoekaaaaappjaaaaaoeia
acaaaaadadaaapiaaaaaffibadaaoekaafaaaaadaeaaapiaadaaoeiaadaaoeia
acaaaaadafaaapiaaaaaaaibacaaoekaacaaaaadaaaaapiaaaaakkibaeaaoeka
aeaaaaaeaeaaapiaafaaoeiaafaaoeiaaeaaoeiaaeaaaaaeaeaaapiaaaaaoeia
aaaaoeiaaeaaoeiaahaaaaacagaaabiaaeaaaaiaahaaaaacagaaaciaaeaaffia
ahaaaaacagaaaeiaaeaakkiaahaaaaacagaaaiiaaeaappiaaeaaaaaeabaaapia
aeaaoeiaafaaoekaabaappiaafaaaaadaeaaahiaacaaoejabjaappkaafaaaaad
ahaaahiaaeaaffiabgaaoekaaeaaaaaeaeaaaliabfaakekaaeaaaaiaahaakeia
aeaaaaaeaeaaahiabhaaoekaaeaakkiaaeaapeiaafaaaaadadaaapiaadaaoeia
aeaaffiaaeaaaaaeadaaapiaafaaoeiaaeaaaaiaadaaoeiaaeaaaaaeaaaaapia
aaaaoeiaaeaakkiaadaaoeiaafaaaaadaaaaapiaagaaoeiaaaaaoeiaalaaaaad
aaaaapiaaaaaoeiacgaakkkaagaaaaacadaaabiaabaaaaiaagaaaaacadaaacia
abaaffiaagaaaaacadaaaeiaabaakkiaagaaaaacadaaaiiaabaappiaafaaaaad
aaaaapiaaaaaoeiaadaaoeiaafaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaae
abaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappiaaaaaoeiaabaaaaacaeaaaiia
cgaappkaajaaaaadabaaabiaakaaoekaaeaaoeiaajaaaaadabaaaciaalaaoeka
aeaaoeiaajaaaaadabaaaeiaamaaoekaaeaaoeiaafaaaaadadaaapiaaeaacjia
aeaakeiaajaaaaadafaaabiaanaaoekaadaaoeiaajaaaaadafaaaciaaoaaoeka
adaaoeiaajaaaaadafaaaeiaapaaoekaadaaoeiaacaaaaadabaaahiaabaaoeia
afaaoeiaafaaaaadaaaaaiiaaeaaffiaaeaaffiaaeaaaaaeaaaaaiiaaeaaaaia
aeaaaaiaaaaappibabaaaaacacaaahoaaeaaoeiaaeaaaaaeabaaahiabaaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaaeaaaaaeaaaaadma
acaappiaaaaaoekaacaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefc
aiamaaaaeaaaabaaacadaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaae
egiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
hcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaa
agbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
abaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaa
agacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaa
acaaaaaapgipcaaaadaaaaaaacaaaaaaagaabaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaa
acaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaaagaabaia
ebaaaaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaaaaaaaaajpcaabaaa
aaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaabaaaaaaaeaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaadaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_WavingTint]
Vector 27 [_WaveAndDistance]
Vector 28 [_CameraPosition]
Vector 29 [_CameraRight]
Vector 30 [_CameraUp]
Vector 31 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[39] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..31],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEMP R8;
MUL R7.xyz, vertex.normal, c[25].w;
DP3 R7.w, R7, c[6];
DP3 R8.x, R7, c[5];
ADD R0.xyz, vertex.position, -c[28];
DP3 R0.x, R0, R0;
SLT R0.x, c[27].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[29], vertex.position;
MAD R0.xyz, R0.y, c[30], R1;
MUL R0.w, R0.z, c[27].y;
MUL R1.xyz, R0.w, c[33];
MUL R0.w, R0.x, c[27].y;
MAD R2, R0.w, c[32], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[27].x, R2;
FRC R1, R1;
MUL R1, R1, c[33].w;
ADD R2, R1, -c[34].x;
MUL R1, R2, R2;
MUL R3, R1, R2;
MAD R2, R3, c[34].w, R2;
MUL R3, R3, R1;
MOV R8.y, R7.w;
MAD R2, R3, c[34].z, R2;
MUL R1, R3, R1;
MAD R1, R1, c[34].y, R2;
MUL R1, R1, R1;
MUL R2, R1, R1;
MUL R3, R2, vertex.attrib[14].y;
MOV R1.w, vertex.position;
DP4 R1.y, R3, c[35];
DP4 R1.x, R3, c[36];
MAD R1.xz, -R1.xyyw, c[27].z, R0;
MOV R1.y, R0;
DP4 R0.x, R1, c[6];
ADD R4, -R0.x, c[11];
MUL R0, R4, R4;
DP4 R3.x, R1, c[5];
ADD R3, -R3.x, c[10];
MUL R4, R7.w, R4;
MAD R5, R3, R3, R0;
MAD R3, R8.x, R3, R4;
DP3 R4.w, R7, c[7];
DP4 R6.x, R1, c[7];
ADD R0, -R6.x, c[12];
MAD R5, R0, R0, R5;
MAD R0, R4.w, R0, R3;
MUL R6, R5, c[13];
MOV R8.z, R4.w;
RSQ R3.x, R5.x;
RSQ R3.y, R5.y;
RSQ R3.z, R5.z;
RSQ R3.w, R5.w;
MUL R0, R0, R3;
ADD R3, R6, c[38].x;
MOV R8.w, c[38].x;
RCP R3.x, R3.x;
RCP R3.y, R3.y;
RCP R3.w, R3.w;
RCP R3.z, R3.z;
MAX R0, R0, c[38].y;
MUL R0, R0, R3;
MUL R3.xyz, R0.y, c[15];
MAD R3.xyz, R0.x, c[14], R3;
MAD R0.xyz, R0.z, c[16], R3;
MAD R4.xyz, R0.w, c[17], R0;
MUL R0, R8.xyzz, R8.yzzx;
MUL R3.z, R7.w, R7.w;
DP4 R3.w, R1, c[4];
DP4 R3.x, R1, c[1];
DP4 R3.y, R1, c[2];
MUL R5.xyz, R3.xyww, c[37].w;
DP4 R7.z, R0, c[23];
DP4 R7.y, R0, c[22];
DP4 R7.x, R0, c[21];
MAD R3.z, R8.x, R8.x, -R3;
MUL R0.xyz, R3.z, c[24];
DP4 R3.z, R1, c[3];
DP4 R6.z, R8, c[20];
DP4 R6.y, R8, c[19];
DP4 R6.x, R8, c[18];
ADD R6.xyz, R6, R7;
ADD R0.xyz, R6, R0;
ADD result.texcoord[2].xyz, R0, R4;
MUL R0.y, R5, c[9].x;
MOV R0.x, R5;
ADD result.texcoord[3].xy, R0, R5.z;
ADD R0.xyz, R1, -c[28];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[27].w;
MUL R0.y, R0.x, c[28].w;
MOV R0.x, c[37].w;
MUL R0.w, R0.y, c[0].y;
ADD R1.xyz, -R0.x, c[26];
DP4 R0.x, R2, c[37].xxyz;
MAD R0.xyz, R0.x, R1, c[37].w;
MIN R0.w, R0, c[38].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R3;
MOV result.texcoord[3].zw, R3;
MAX result.color.w, R0, c[38].y;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].z, R4.w;
MOV result.texcoord[1].y, R7.w;
MOV result.texcoord[1].x, R8;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
END
# 106 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_WavingTint]
Vector 27 [_WaveAndDistance]
Vector 28 [_CameraPosition]
Vector 29 [_CameraRight]
Vector 30 [_CameraUp]
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c33, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c34, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c35, 0.00600000, 0.02000000, 0.05000000, -0.00019841
def c36, 0.00833330, -0.16161616, -0.50000000, 0.50000000
def c37, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c38, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c39, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r7.xyz, v2, c25.w
dp3 r7.w, r7, c5
dp3 r8.x, r7, c4
add r0.xyz, v0, -c28
dp3 r0.x, r0, r0
slt r0.x, c27.w, r0
max r0.x, -r0, r0
slt r0.x, c33, r0
add r0.x, -r0, c33.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c29, v0
mad r0.xyz, r0.y, c30, r1
mul r0.w, r0.z, c27.y
mul r1.xyz, r0.w, c35
mul r0.w, r0.x, c27.y
mad r1, r0.w, c34, r1.xyyz
mov r0.w, c27.x
mad r1, c32, r0.w, r1
frc r1, r1
mad r2, r1, c33.z, c33.w
mul r1, r2, r2
mul r3, r1, r2
mad r2, r3, c36.y, r2
mul r3, r3, r1
mov r8.y, r7.w
mad r2, r3, c36.x, r2
mul r1, r3, r1
mad r1, r1, c35.w, r2
mul r1, r1, r1
mul r2, r1, r1
mul r3, r2, v1.y
mov r1.w, v0
dp4 r1.y, r3, c37
dp4 r1.x, r3, c38
mad r1.xz, -r1.xyyw, c27.z, r0
mov r1.y, r0
dp4 r0.x, r1, c5
add r4, -r0.x, c11
mul r0, r4, r4
dp4 r3.x, r1, c4
add r3, -r3.x, c10
mul r4, r7.w, r4
mad r5, r3, r3, r0
mad r3, r8.x, r3, r4
dp3 r4.w, r7, c6
dp4 r6.x, r1, c6
add r0, -r6.x, c12
mad r5, r0, r0, r5
mad r0, r4.w, r0, r3
mul r6, r5, c13
mov r8.z, r4.w
rsq r3.x, r5.x
rsq r3.y, r5.y
rsq r3.z, r5.z
rsq r3.w, r5.w
mul r0, r0, r3
add r3, r6, c33.y
mov r8.w, c33.y
rcp r3.x, r3.x
rcp r3.y, r3.y
rcp r3.w, r3.w
rcp r3.z, r3.z
max r0, r0, c33.x
mul r0, r0, r3
mul r3.xyz, r0.y, c15
mad r3.xyz, r0.x, c14, r3
mad r0.xyz, r0.z, c16, r3
mad r4.xyz, r0.w, c17, r0
mul r0, r8.xyzz, r8.yzzx
mul r3.z, r7.w, r7.w
dp4 r3.w, r1, c3
dp4 r3.x, r1, c0
dp4 r3.y, r1, c1
mul r5.xyz, r3.xyww, c36.w
dp4 r7.z, r0, c23
dp4 r7.y, r0, c22
dp4 r7.x, r0, c21
mad r3.z, r8.x, r8.x, -r3
mul r0.xyz, r3.z, c24
dp4 r3.z, r1, c2
dp4 r6.z, r8, c20
dp4 r6.y, r8, c19
dp4 r6.x, r8, c18
add r6.xyz, r6, r7
add r0.xyz, r6, r0
add oT2.xyz, r0, r4
mul r0.y, r5, c8.x
mov r0.x, r5
mad oT3.xy, r5.z, c9.zwzw, r0
add r0.xyz, r1, -c28
dp3 r0.x, r0, r0
add r0.x, -r0, c27.w
mul r0.w, r0.x, c28
mov r0.xyz, c26
add r1.xyz, c36.z, r0
mul r0.w, r0, c32.y
dp4 r0.x, r2, c39.xxyz
mad r0.xyz, r0.x, r1, c36.w
min r0.w, r0, c33.y
mul r0.xyz, r0, v5
mov oPos, r3
mov oT3.zw, r3
max oD0.w, r0, c33.x
mul oD0.xyz, r0, c32.y
mov oT1.z, r4.w
mov oT1.y, r7.w
mov oT1.x, r8
mad oT0.xy, v3, c31, c31.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedjkohgkbhppiifodhobnogelkcajedhbjabaaaaaaieaoaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcmmamaaaaeaaaabaaddadaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
aeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaai
iccabaaaacaaaaaapgipcaaaaeaaaaaaacaaaaaaagaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaalhcaabaaaacaaaaaaegiccaaaaeaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaacaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaa
acaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
acaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaa
egadbaaaacaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaacaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaa
acaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaafaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaa
acaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaa
agaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
afaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaaj
pcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaa
diaaaaahpcaabaaaagaaaaaafgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaah
pcaabaaaafaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
afaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaaaaaaaaakgakbaaaacaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaafaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaaaaaaaaadcaaaaan
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaa
abaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedhifhikeoaebacblnmnonjidodflmjlkiabaaaaaahmbgaaaaaeaaaaaa
daaaaaaaceaiaaaapibeaaaamabfaaaaebgpgodjomahaaaaomahaaaaaaacpopp
geahaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaajaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaaeaabgaa
aaaaaaaaadaabeaaabaabkaaaaaaaaaaaeaaaaaaafaablaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafcaaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
cbaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafccaaapkakgjlmedl
aknhkddmmnmmemdnlfhocflofbaaaaafcdaaapkafnjicmdphnbdikdohnbdakdo
dddddddpfbaaaaafceaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaaf
cfaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafcgaaapkakgjlmedl
aknhkddmaknhkdlmmnmmmmdnfbaaaaafchaaapkaaaaaaalpaaaaaadpaaaaaaaa
aaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapja
acaaaaadaaaaahiaaaaaoejabnaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeia
amaaaaadaaaaabiabmaappkaaaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejb
abaaoejaaeaaaaaeaaaaaniaaaaaaaiaboaajekaaaaajejaaeaaaaaeaaaaahia
aaaaffiabpaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiiabmaaffkaafaaaaad
acaaapiaabaaffiaccaajekaaeaaaaaeabaaapiaabaaaaiaceaaoekaacaaoeia
abaaaaacacaaabiabmaaaakaaeaaaaaeabaaapiaacaaaaiacaaaoekaabaaoeia
bdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeiacbaaaakacbaaffka
afaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeia
aeaaaaaeabaaapiaadaaoeiaccaappkaabaaoeiaafaaaaadadaaapiaacaaoeia
adaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeia
cbaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiacbaappkaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
acaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeiacdaajakaafaaaaad
aaaaaiiaaaaappiacdaappkaajaaaaadabaaabiaacaaoeiacfaaoekaajaaaaad
abaaaeiaacaaoeiacgaaoekaaeaaaaaeaaaaafiaabaaoeiabmaakkkbaaaaoeia
acaaaaadabaaahiaaaaaoeiabnaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeia
acaaaaadabaaabiaabaaaaibbmaappkaafaaaaadabaaabiaabaaaaiabnaappka
acaaaaadabaaabiaabaaaaiaabaaaaiaalaaaaadabaaabiaabaaaaiachaakkka
akaaaaadabaaaioaabaaaaiachaappkaabaaaaacabaaajiachaaoekaacaaaaad
abaaahiaabaaaaiablaaoekaaeaaaaaeabaaahiaaaaappiaabaaoeiachaaffka
acaaaaadabaaahiaabaaoeiaabaaoeiaafaaaaadabaaahoaabaaoeiaafaaoeja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadabaaahiaaaaaffia
bhaaoekaafaaaaadacaaapiaaaaaffiabdaaoekaaeaaaaaeacaaapiabcaaoeka
aaaaaaiaacaaoeiaaeaaaaaeacaaapiabeaaoekaaaaakkiaacaaoeiaaeaaaaae
acaaapiabfaaoekaaaaappjaacaaoeiaaeaaaaaeaaaaaliabgaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabiaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaahia
bjaaoekaaaaappjaaaaaoeiaacaaaaadadaaapiaaaaaffibaeaaoekaafaaaaad
aeaaapiaadaaoeiaadaaoeiaacaaaaadafaaapiaaaaaaaibadaaoekaacaaaaad
aaaaapiaaaaakkibafaaoekaaeaaaaaeaeaaapiaafaaoeiaafaaoeiaaeaaoeia
aeaaaaaeaeaaapiaaaaaoeiaaaaaoeiaaeaaoeiaahaaaaacagaaabiaaeaaaaia
ahaaaaacagaaaciaaeaaffiaahaaaaacagaaaeiaaeaakkiaahaaaaacagaaaiia
aeaappiaaeaaaaaeabaaapiaaeaaoeiaagaaoekaabaappiaafaaaaadaeaaahia
acaaoejabkaappkaafaaaaadahaaahiaaeaaffiabhaaoekaaeaaaaaeaeaaalia
bgaakekaaeaaaaiaahaakeiaaeaaaaaeaeaaahiabiaaoekaaeaakkiaaeaapeia
afaaaaadadaaapiaadaaoeiaaeaaffiaaeaaaaaeadaaapiaafaaoeiaaeaaaaia
adaaoeiaaeaaaaaeaaaaapiaaaaaoeiaaeaakkiaadaaoeiaafaaaaadaaaaapia
agaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeiachaakkkaagaaaaacadaaabia
abaaaaiaagaaaaacadaaaciaabaaffiaagaaaaacadaaaeiaabaakkiaagaaaaac
adaaaiiaabaappiaafaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadabaaahia
aaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappia
aaaaoeiaabaaaaacaeaaaiiachaappkaajaaaaadabaaabiaalaaoekaaeaaoeia
ajaaaaadabaaaciaamaaoekaaeaaoeiaajaaaaadabaaaeiaanaaoekaaeaaoeia
afaaaaadadaaapiaaeaacjiaaeaakeiaajaaaaadafaaabiaaoaaoekaadaaoeia
ajaaaaadafaaaciaapaaoekaadaaoeiaajaaaaadafaaaeiabaaaoekaadaaoeia
acaaaaadabaaahiaabaaoeiaafaaoeiaafaaaaadaaaaaiiaaeaaffiaaeaaffia
aeaaaaaeaaaaaiiaaeaaaaiaaeaaaaiaaaaappibabaaaaacacaaahoaaeaaoeia
aeaaaaaeabaaahiabbaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeia
abaaoeiaafaaaaadaaaaahiaacaapeiachaaffkaafaaaaadaaaaaiiaaaaaffia
acaaaakaacaaaaadaeaaadoaaaaakkiaaaaaomiaaeaaaaaeaaaaadmaacaappia
aaaaoekaacaaoeiaabaaaaacaaaaammaacaaoeiaabaaaaacaeaaamoaacaaoeia
ppppaaaafdeieefcmmamaaaaeaaaabaaddadaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaaeaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaaeaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaaagaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaalhcaabaaa
acaaaaaaegiccaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
acaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaa
bbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaaeaaaaaa
bbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaaeaaaaaa
bbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaaeaaaaaa
aaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaaagaabaiaebaaaaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaahpcaabaaaagaaaaaa
fgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaaaaaaaaakgakbaaaacaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaafaaaaaaeeaaaaaf
pcaabaaaaeaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaaeaaaaaadeaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MAX R1.w, R1, c[3].x;
MUL result.color.w, R0, fragment.color.primary;
KIL -R1.x;
MUL R1.xyz, R0, fragment.texcoord[2];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[3].y, R1;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c3, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mul r1, r0, v0
mul_pp r2.xyz, r1, t2
add_pp r0.x, r1.w, -c2
cmp r0.x, r0, c3, c3.y
mov_pp r0, -r0.x
mul_pp r1.xyz, r1, c1
texkill r0.xyzw
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.w, r1, v0
mad_pp r0.xyz, r0, c3.z, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 64 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedjbckjefphbdonkdkjbpencmdfdlngphaabaaaaaaaaadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcpeabaaaaeaaaaaaahnaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaadaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaaiocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 64 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedoddipjpdjofflondcilbflmegoadialoabaaaaaahaaeaaaaaeaaaaaa
daaaaaaajmabaaaajiadaaaadmaeaaaaebgpgodjgeabaaaageabaaaaaaacpppp
biabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaaabaaaaaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaabaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoelaebaaaaababaaapiaaiaaaaadabaacbia
acaaoelaacaaoekaalaaaaadacaaciiaabaaaaiaadaaaakaacaaaaadabaacbia
acaappiaacaappiaafaaaaadabaacoiaaaaabliaaaaablkaafaaaaadaaaachia
aaaaoeiaadaaoelaafaaaaadacaaciiaaaaappiaabaapplaaeaaaaaeacaachia
abaabliaabaaaaiaaaaaoeiaabaaaaacaaaicpiaacaaoeiappppaaaafdeieefc
peabaaaaeaaaaaaahnaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaa
aaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
baaaaaaibcaabaaaabaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaaaaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaiocaabaaa
abaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaahiccabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, R0, fragment.color.primary;
SLT R2.x, R1.w, c[0];
MUL result.color.w, R1, fragment.color.primary;
TEX R0, fragment.texcoord[1], texture[1], 2D;
KIL -R2.x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[1].x;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xy
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r2, -r0.x
texld r0, t1, s1
texkill r2.xyzw
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c1.z
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlhadoapghehnjapalpjgakdhoefimhdpabaaaaaakiacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjjkchicddboflofbojblbljhahljhkbjabaaaaaaoaadaaaaaeaaaaaa
daaaaaaageabaaaacaadaaaakmadaaaaebgpgodjcmabaaaacmabaaaaaaacpppp
peaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacacaaadiaaaaabllaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaabaioekaafaaaaadabaaciiaabaappia
abaaaakaafaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaachiaaaaaoeia
abaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaacaaaicpiaabaaoeia
ppppaaaafdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab
ejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, R0, fragment.color.primary;
SLT R2.x, R1.w, c[0];
MUL result.color.w, R1, fragment.color.primary;
TEX R0, fragment.texcoord[1], texture[1], 2D;
KIL -R2.x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[1].x;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xy
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r2, -r0.x
texld r0, t1, s1
texkill r2.xyzw
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c1.z
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlhadoapghehnjapalpjgakdhoefimhdpabaaaaaakiacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjjkchicddboflofbojblbljhahljhkbjabaaaaaaoaadaaaaaeaaaaaa
daaaaaaageabaaaacaadaaaakmadaaaaebgpgodjcmabaaaacmabaaaaaaacpppp
peaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacacaaadiaaaaabllaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaabaioekaafaaaaadabaaciiaabaappia
abaaaakaafaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaachiaaaaaoeia
abaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaacaaaicpiaabaaoeia
ppppaaaafdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab
ejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R2.x, fragment.texcoord[3], texture[1], 2D;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MAX R1.w, R1, c[3].x;
MUL R1.w, R1, R2.x;
MUL result.color.w, R0, fragment.color.primary;
KIL -R1.x;
MUL R1.xyz, R0, fragment.texcoord[2];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[3].y, R1;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r0, t0, s0
texldp r3, t3, s1
mul r1, r0, v0
mul_pp r2.xyz, r1, c1
add_pp r0.x, r1.w, -c2
cmp r0.x, r0, c3, c3.y
mov_pp r0, -r0.x
mul_pp r1.xyz, r1, t2
texkill r0.xyzw
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c3
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r0.w, r1, v0
mad_pp r0.xyz, r0, c3.z, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedfjkkhafmjpgdmoaaplggaednojojdincabaaaaaaiaadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
fmacaaaaeaaaaaaajhaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aiaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaadaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaabaaaaaafgafbaaaabaaaaaaagaabaaaabaaaaaa
diaaaaaiocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecednpkmnhecjkccjciabjaknppinijfjcekabaaaaaaemafaaaaaeaaaaaa
daaaaaaapiabaaaafmaeaaaabiafaaaaebgpgodjmaabaaaamaabaaaaaaacpppp
haabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaaabaaaaaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaapla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapia
aaaaoelaabaioekaaeaaaaaeabaacpiaaaaappiaabaapplaabaaaakbafaaaaad
aaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaaeaapplaafaaaaadacaaadia
acaappiaaeaaoelaebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaaaaioeka
aiaaaaadabaacciaacaaoelaacaaoekaafaaaaadabaacbiaabaaaaiaabaaffia
fiaaaaaeabaacbiaabaaffiaabaaaaiaadaaaakaacaaaaadabaacbiaabaaaaia
abaaaaiaafaaaaadabaacoiaaaaabliaaaaablkaafaaaaadaaaachiaaaaaoeia
adaaoelaafaaaaadacaaciiaaaaappiaabaapplaaeaaaaaeacaachiaabaablia
abaaaaiaaaaaoeiaabaaaaacaaaicpiaacaaoeiappppaaaafdeieefcfmacaaaa
eaaaaaaajhaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaaabaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaaaa
apaaaaahbcaabaaaabaaaaaafgafbaaaabaaaaaaagaabaaaabaaaaaadiaaaaai
ocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
jgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[0];
MUL result.color.w, R0, fragment.color.primary;
KIL -R1.x;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[1].x;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[1].y;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL result.color.xyz, R0, R1;
END
# 15 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 1.00000000, 8.00000000, 2.00000000
dcl t0.xy
dcl v0
dcl t1.xy
dcl t2
texldp r1, t2, s1
texld r0, t0, s0
mul r2, r0, v0
add_pp r0.x, r2.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
texld r0, t1, s2
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1.x
mul_pp r3.xyz, r3, c1.z
mul_pp r0.xyz, r0, c1.w
mul_pp r1.xyz, r3, r1.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r1
mul_pp r0.xyz, r2, r0
mul_pp r0.w, r2, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlnpbgodeapeegjginedgohdcljjlehmkabaaaaaaleadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefckiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgafbaaa
abaaaaaaagajbaaaacaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
acaaaaaaddaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadeaaaaah
hcaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddhifmopkbbcladmcnhgnkjdnjifdnlbbabaaaaaaieafaaaaaeaaaaaa
daaaaaaapmabaaaakmaeaaaafaafaaaaebgpgodjmeabaaaameabaaaaaaacpppp
iiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaaiaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapia
aaaaoelaabaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakbafaaaaad
aaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaacaapplaafaaaaadacaaadia
acaappiaacaaoelaabaaaaacadaaadiaaaaabllaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaaaaioekaecaaaaadacaacpiaadaaoeiaacaioekaacaaaaad
abaacciaabaaaaiaabaaaaiaafaaaaadabaacoiaacaabliaabaaffiaafaaaaad
acaaciiaacaappiaabaaaakaafaaaaadacaachiaacaaoeiaacaappiaakaaaaad
adaachiaabaabliaacaaoeiaafaaaaadabaachiaabaaaaiaacaaoeiaalaaaaad
acaachiaadaaoeiaabaaoeiaafaaaaadabaachiaaaaaoeiaacaaoeiaafaaaaad
abaaciiaaaaappiaabaapplaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefc
kiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aiaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgafbaaaabaaaaaaagajbaaa
acaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaddaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadeaaaaahhcaabaaaabaaaaaa
jgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[0];
MUL result.color.w, R0, fragment.color.primary;
KIL -R1.x;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[1].x;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[1].y;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL result.color.xyz, R0, R1;
END
# 15 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 1.00000000, 8.00000000, 2.00000000
dcl t0.xy
dcl v0
dcl t1.xy
dcl t2
texldp r1, t2, s1
texld r0, t0, s0
mul r2, r0, v0
add_pp r0.x, r2.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
texld r0, t1, s2
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1.x
mul_pp r3.xyz, r3, c1.z
mul_pp r0.xyz, r0, c1.w
mul_pp r1.xyz, r3, r1.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r1
mul_pp r0.xyz, r2, r0
mul_pp r0.w, r2, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlnpbgodeapeegjginedgohdcljjlehmkabaaaaaaleadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefckiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaiaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgafbaaa
abaaaaaaagajbaaaacaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
acaaaaaaddaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadeaaaaah
hcaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddhifmopkbbcladmcnhgnkjdnjifdnlbbabaaaaaaieafaaaaaeaaaaaa
daaaaaaapmabaaaakmaeaaaafaafaaaaebgpgodjmeabaaaameabaaaaaaacpppp
iiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaaiaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapia
aaaaoelaabaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakbafaaaaad
aaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaacaapplaafaaaaadacaaadia
acaappiaacaaoelaabaaaaacadaaadiaaaaabllaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaaaaioekaecaaaaadacaacpiaadaaoeiaacaioekaacaaaaad
abaacciaabaaaaiaabaaaaiaafaaaaadabaacoiaacaabliaabaaffiaafaaaaad
acaaciiaacaappiaabaaaakaafaaaaadacaachiaacaaoeiaacaappiaakaaaaad
adaachiaabaabliaacaaoeiaafaaaaadabaachiaabaaaaiaacaaoeiaalaaaaad
acaachiaadaaoeiaabaaoeiaafaaaaadabaachiaaaaaoeiaacaaoeiaafaaaaad
abaaciiaaaaappiaabaapplaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefc
kiacaaaaeaaaaaaakkaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaa
abaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaa
aiaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgafbaaaabaaaaaaagajbaaa
acaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaddaaaaah
ocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadeaaaaahhcaabaaaabaaaaaa
jgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[22];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[21], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[22].w;
ADD R0, R0, -c[23].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[23].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[23].z, R0;
MAD R0, R1, c[23].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[25];
DP4 R2.y, R1, c[24];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
DP4 R2.w, R1, c[8];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 result.texcoord[3].z, R2, c[11];
DP4 result.texcoord[3].y, R2, c[10];
DP4 result.texcoord[3].x, R2, c[9];
ADD result.texcoord[2].xyz, -R2, c[13];
ADD R2.xyz, R1, -c[17];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[16].w;
MUL R2.x, R2, c[17].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[27].x;
MOV R1.x, c[26].w;
ADD R1.xyz, -R1.x, c[15];
DP4 R0.x, R0, c[26].xxyz;
MAD R0.xyz, R0.x, R1, c[26].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[27].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 60 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_CameraRight]
Vector 18 [_CameraUp]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c21, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c22, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c23, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c24, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c25, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c26, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c27, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c16
dp3 r0.x, r0, r0
slt r0.x, c15.w, r0
max r0.x, -r0, r0
slt r0.x, c20, r0
add r0.x, -r0, c20.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c17, v0
mad r3.xyz, r0.y, c18, r1
mul r0.x, r3.z, c15.y
mul r1.xyz, r0.x, c21
mul r0.x, r3, c15.y
mad r0, r0.x, c22, r1.xyyz
mov r1.x, c15
mad r0, c23, r1.x, r0
frc r0, r0
mad r0, r0, c20.z, c20.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c21.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c24.x, r0
mad r0, r1, c24.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c26
dp4 r2.y, r1, c25
mad r1.xz, -r2.xyyw, c15.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
dp4 r2.w, r1, c7
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 oT3.z, r2, c10
dp4 oT3.y, r2, c9
dp4 oT3.x, r2, c8
add oT2.xyz, -r2, c12
add r2.xyz, r1, -c16
dp3 r2.x, r2, r2
add r2.x, -r2, c15.w
mul r2.x, r2, c16.w
mul r1.w, r2.x, c23.y
mov r1.xyz, c14
min r1.w, r1, c20.y
add r1.xyz, c24.z, r1
dp4 r0.x, r0, c27.xxyz
mad r0.xyz, r0.x, r1, c24.w
mul r1.xyz, v2, c13.w
mul r0.xyz, r0, v5
max oD0.w, r1, c20.x
mul oD0.xyz, r0, c23.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedoiommgdmaebfnnhccpoapmohicaoklckabaaaaaanmakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcceajaaaaeaaaabaaejacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaa
agbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
abaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaa
agacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaai
iccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaacaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedbdnpamfbigfpglnfbckjkkdaefdohpogabaaaaaamebaaaaaaeaaaaaa
daaaaaaabeagaaaaeaapaaaaaibaaaaaebgpgodjnmafaaaanmafaaaaaaacpopp
gaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaafaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
bcaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabbaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabdaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabeaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabbaaffkaafaaaaadacaaapiaabaaffiabfaajeka
aeaaaaaeabaaapiaabaaaaiabjaaoekaacaaoeiaabaaaaacacaaabiabbaaaaka
aeaaaaaeabaaapiaacaaaaiabgaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabhaaaakabhaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bfaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabhaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabhaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabiaajakaafaaaaadaaaaaiiaaaaappiabiaappka
ajaaaaadabaaabiaacaaoeiabkaaoekaajaaaaadabaaaeiaacaaoeiablaaoeka
aeaaaaaeaaaaafiaabaaoeiabbaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeia
bcaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaib
bbaappkaafaaaaadabaaabiaabaaaaiabcaappkaacaaaaadabaaabiaabaaaaia
abaaaaiaalaaaaadabaaabiaabaaaaiabmaakkkaakaaaaadabaaaioaabaaaaia
bmaappkaabaaaaacabaaabiabmaaaakaacaaaaadabaaahiaabaaaaiabaaaoeka
aeaaaaaeabaaahiaaaaappiaabaaoeiabmaaffkaacaaaaadabaaahiaabaaoeia
abaaoeiaafaaaaadabaaahoaabaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadabaaahiaacaaoejaapaappkaafaaaaadacaaahia
abaaffiaamaaoekaaeaaaaaeabaaaliaalaakekaabaaaaiaacaakeiaaeaaaaae
acaaahoaanaaoekaabaakkiaabaapeiaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoeka
aaaakkiaabaaoeiaaeaaaaaeabaaahiaaoaaoekaaaaappjaabaaoeiaacaaaaad
adaaahoaabaaoeibagaaoekaafaaaaadabaaapiaaaaaffiaamaaoekaafaaaaad
acaaapiaaaaaffiaaiaaoekaaeaaaaaeacaaapiaahaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaajaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaakaaoeka
aaaappjaacaaoeiaaeaaaaaeabaaapiaalaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaae
aeaaahoaaeaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaadmaacaappiaaaaaoeka
acaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefcceajaaaaeaaaabaa
ejacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaj
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
acaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_WavingTint]
Vector 12 [_WaveAndDistance]
Vector 13 [_CameraPosition]
Vector 14 [_CameraRight]
Vector 15 [_CameraUp]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[13];
DP3 R0.x, R0, R0;
SLT R0.x, c[12].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[14], vertex.position;
MAD R3.xyz, R0.y, c[15], R1;
MUL R0.x, R3.z, c[12].y;
MUL R1.xyz, R0.x, c[18];
MUL R0.x, R3, c[12].y;
MAD R1, R0.x, c[17], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[12].x, R1;
FRC R0, R0;
MUL R0, R0, c[18].w;
ADD R0, R0, -c[19].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[19].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[19].z, R0;
MAD R0, R1, c[19].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[21];
DP4 R2.y, R1, c[20];
MAD R1.xz, -R2.xyyw, c[12].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R2.xyz, R1, -c[13];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[12].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MUL R2.x, R2, c[13].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[23].x;
MOV R1.x, c[22].w;
ADD R1.xyz, -R1.x, c[11];
DP4 R0.x, R0, c[22].xxyz;
MAD R0.xyz, R0.x, R1, c[22].w;
MUL R1.xyz, vertex.normal, c[10].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[23].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[9];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 53 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c17, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c18, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c19, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c20, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c21, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c22, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c23, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c12
dp3 r0.x, r0, r0
slt r0.x, c11.w, r0
max r0.x, -r0, r0
slt r0.x, c16, r0
add r0.x, -r0, c16.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c13, v0
mad r3.xyz, r0.y, c14, r1
mul r0.x, r3.z, c11.y
mul r1.xyz, r0.x, c17
mul r0.x, r3, c11.y
mad r0, r0.x, c18, r1.xyyz
mov r1.x, c11
mad r0, c19, r1.x, r0
frc r0, r0
mad r0, r0, c16.z, c16.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c17.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c20.x, r0
mad r0, r1, c20.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c22
dp4 r2.y, r1, c21
mad r1.xz, -r2.xyyw, c11.z, r3
mov r1.y, r3
mov r1.w, v0
add r2.xyz, r1, -c12
dp3 r2.x, r2, r2
add r2.x, -r2, c11.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mul r2.x, r2, c12.w
mul r1.w, r2.x, c19.y
mov r1.xyz, c10
min r1.w, r1, c16.y
add r1.xyz, c20.z, r1
dp4 r0.x, r0, c23.xxyz
mad r0.xyz, r0.x, r1, c20.w
mul r1.xyz, v2, c9.w
mul r0.xyz, r0, v5
max oD0.w, r1, c16.x
mul oD0.xyz, r0, c19.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c8
mad oT0.xy, v3, c15, c15.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedhdmbebbbeegpngngeompbheeeohdfhilabaaaaaaoeaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefceeahaaaa
eaaaabaanbabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedmacpbfcecchaocoanfifglohlojggpieabaaaaaanianaaaaaeaaaaaa
daaaaaaacaafaaaagmamaaaadeanaaaaebgpgodjoiaeaaaaoiaeaaaaaaacpopp
hiaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabeaaabaaakaaaaaaaaaaadaaaaaaafaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbaaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafbbaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
bcaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbdaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbeaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafbfaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
bgaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbhaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaanaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaamaaaaadaaaaabiaamaappkaaaaaaaiaaeaaaaaeaaaaadia
aaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiaaoaajekaaaaajeja
aeaaaaaeaaaaahiaaaaaffiaapaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiia
amaaffkaafaaaaadacaaapiaabaaffiabaaajekaaeaaaaaeabaaapiaabaaaaia
beaaoekaacaaoeiaabaaaaacacaaabiaamaaaakaaeaaaaaeabaaapiaacaaaaia
bbaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
bcaaaakabcaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapia
abaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiabaaappkaabaaoeiaafaaaaad
adaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaae
abaaapiaadaaoeiabcaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiabcaappka
abaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeia
abaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeia
bdaajakaafaaaaadaaaaaiiaaaaappiabdaappkaajaaaaadabaaabiaacaaoeia
bfaaoekaajaaaaadabaaaeiaacaaoeiabgaaoekaaeaaaaaeaaaaafiaabaaoeia
amaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaaeaaoekaaeaaaaaeabaaapia
adaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaafaaoekaaaaakkiaabaaoeia
acaaaaadaaaaahiaaaaaoeiaanaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeia
acaaaaadaaaaabiaaaaaaaibamaappkaafaaaaadaaaaabiaaaaaaaiaanaappka
acaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabiaaaaaaaiabhaakkka
akaaaaadabaaaioaaaaaaaiabhaappkaaeaaaaaeabaaapiaagaaoekaaaaappja
abaaoeiaabaaaaacaaaaabiabhaaaakaacaaaaadaaaaahiaaaaaaaiaalaaoeka
aeaaaaaeaaaaahiaaaaappiaaaaaoeiabhaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadacaaahia
aaaaffiaaiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaacaakeiaaeaaaaae
acaaahoaajaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaadmaabaappiaaaaaoeka
abaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacadaaahoaacaaoekappppaaaa
fdeieefceeahaaaaeaaaabaanbabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaa
fgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaa
abaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[22];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[21], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[22].w;
ADD R0, R0, -c[23].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[23].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[23].z, R0;
MAD R0, R1, c[23].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[25];
DP4 R2.y, R1, c[24];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
DP4 R2.w, R1, c[8];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 result.texcoord[3].w, R2, c[12];
DP4 result.texcoord[3].z, R2, c[11];
DP4 result.texcoord[3].y, R2, c[10];
DP4 result.texcoord[3].x, R2, c[9];
ADD result.texcoord[2].xyz, -R2, c[13];
ADD R2.xyz, R1, -c[17];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[16].w;
MUL R2.x, R2, c[17].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[27].x;
MOV R1.x, c[26].w;
ADD R1.xyz, -R1.x, c[15];
DP4 R0.x, R0, c[26].xxyz;
MAD R0.xyz, R0.x, R1, c[26].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[27].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 61 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_CameraRight]
Vector 18 [_CameraUp]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c21, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c22, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c23, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c24, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c25, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c26, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c27, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c16
dp3 r0.x, r0, r0
slt r0.x, c15.w, r0
max r0.x, -r0, r0
slt r0.x, c20, r0
add r0.x, -r0, c20.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c17, v0
mad r3.xyz, r0.y, c18, r1
mul r0.x, r3.z, c15.y
mul r1.xyz, r0.x, c21
mul r0.x, r3, c15.y
mad r0, r0.x, c22, r1.xyyz
mov r1.x, c15
mad r0, c23, r1.x, r0
frc r0, r0
mad r0, r0, c20.z, c20.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c21.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c24.x, r0
mad r0, r1, c24.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c26
dp4 r2.y, r1, c25
mad r1.xz, -r2.xyyw, c15.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
dp4 r2.w, r1, c7
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 oT3.w, r2, c11
dp4 oT3.z, r2, c10
dp4 oT3.y, r2, c9
dp4 oT3.x, r2, c8
add oT2.xyz, -r2, c12
add r2.xyz, r1, -c16
dp3 r2.x, r2, r2
add r2.x, -r2, c15.w
mul r2.x, r2, c16.w
mul r1.w, r2.x, c23.y
mov r1.xyz, c14
min r1.w, r1, c20.y
add r1.xyz, c24.z, r1
dp4 r0.x, r0, c27.xxyz
mad r0.xyz, r0.x, r1, c24.w
mul r1.xyz, v2, c13.w
mul r0.xyz, r0, v5
max oD0.w, r1, c20.x
mul oD0.xyz, r0, c23.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedkkpfanoecifbjcmbjiidkkcooaapedeaabaaaaaanmakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcceajaaaaeaaaabaaejacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaa
agbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
abaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaa
agacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaai
iccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaafgafbaaaacaaaaaaegiocaaaaaaaaaaaaeaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaacaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaafaaaaaa
kgakbaaaacaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
aaaaaaaaagaaaaaapgapbaaaacaaaaaaegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecediecbkoibbmkhjhacnlplmoefmnfmnkchabaaaaaamebaaaaaaeaaaaaa
daaaaaaabeagaaaaeaapaaaaaibaaaaaebgpgodjnmafaaaanmafaaaaaaacpopp
gaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaafaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
bcaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabbaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabdaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabeaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabbaaffkaafaaaaadacaaapiaabaaffiabfaajeka
aeaaaaaeabaaapiaabaaaaiabjaaoekaacaaoeiaabaaaaacacaaabiabbaaaaka
aeaaaaaeabaaapiaacaaaaiabgaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabhaaaakabhaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bfaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabhaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabhaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabiaajakaafaaaaadaaaaaiiaaaaappiabiaappka
ajaaaaadabaaabiaacaaoeiabkaaoekaajaaaaadabaaaeiaacaaoeiablaaoeka
aeaaaaaeaaaaafiaabaaoeiabbaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeia
bcaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaib
bbaappkaafaaaaadabaaabiaabaaaaiabcaappkaacaaaaadabaaabiaabaaaaia
abaaaaiaalaaaaadabaaabiaabaaaaiabmaakkkaakaaaaadabaaaioaabaaaaia
bmaappkaabaaaaacabaaabiabmaaaakaacaaaaadabaaahiaabaaaaiabaaaoeka
aeaaaaaeabaaahiaaaaappiaabaaoeiabmaaffkaacaaaaadabaaahiaabaaoeia
abaaoeiaafaaaaadabaaahoaabaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadabaaahiaacaaoejaapaappkaafaaaaadacaaahia
abaaffiaamaaoekaaeaaaaaeabaaaliaalaakekaabaaaaiaacaakeiaaeaaaaae
acaaahoaanaaoekaabaakkiaabaapeiaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoeka
aaaakkiaabaaoeiaaeaaaaaeabaaahiaaoaaoekaaaaappjaabaaoeiaacaaaaad
adaaahoaabaaoeibagaaoekaafaaaaadabaaapiaaaaaffiaamaaoekaafaaaaad
acaaapiaaaaaffiaaiaaoekaaeaaaaaeacaaapiaahaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaajaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaakaaoeka
aaaappjaacaaoeiaaeaaaaaeabaaapiaalaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaae
aeaaapoaaeaaoekaaaaappiaabaaoeiaaeaaaaaeaaaaadmaacaappiaaaaaoeka
acaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefcceajaaaaeaaaabaa
ejacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaj
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgafbaaaacaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
acaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaacaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaafaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaacaaaaaaegaobaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[22];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[21], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[22].w;
ADD R0, R0, -c[23].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[23].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[23].z, R0;
MAD R0, R1, c[23].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[25];
DP4 R2.y, R1, c[24];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
DP4 R2.w, R1, c[8];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 result.texcoord[3].z, R2, c[11];
DP4 result.texcoord[3].y, R2, c[10];
DP4 result.texcoord[3].x, R2, c[9];
ADD result.texcoord[2].xyz, -R2, c[13];
ADD R2.xyz, R1, -c[17];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[16].w;
MUL R2.x, R2, c[17].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[27].x;
MOV R1.x, c[26].w;
ADD R1.xyz, -R1.x, c[15];
DP4 R0.x, R0, c[26].xxyz;
MAD R0.xyz, R0.x, R1, c[26].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[27].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 60 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_CameraRight]
Vector 18 [_CameraUp]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c21, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c22, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c23, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c24, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c25, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c26, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c27, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c16
dp3 r0.x, r0, r0
slt r0.x, c15.w, r0
max r0.x, -r0, r0
slt r0.x, c20, r0
add r0.x, -r0, c20.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c17, v0
mad r3.xyz, r0.y, c18, r1
mul r0.x, r3.z, c15.y
mul r1.xyz, r0.x, c21
mul r0.x, r3, c15.y
mad r0, r0.x, c22, r1.xyyz
mov r1.x, c15
mad r0, c23, r1.x, r0
frc r0, r0
mad r0, r0, c20.z, c20.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c21.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c24.x, r0
mad r0, r1, c24.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c26
dp4 r2.y, r1, c25
mad r1.xz, -r2.xyyw, c15.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
dp4 r2.w, r1, c7
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 oT3.z, r2, c10
dp4 oT3.y, r2, c9
dp4 oT3.x, r2, c8
add oT2.xyz, -r2, c12
add r2.xyz, r1, -c16
dp3 r2.x, r2, r2
add r2.x, -r2, c15.w
mul r2.x, r2, c16.w
mul r1.w, r2.x, c23.y
mov r1.xyz, c14
min r1.w, r1, c20.y
add r1.xyz, c24.z, r1
dp4 r0.x, r0, c27.xxyz
mad r0.xyz, r0.x, r1, c24.w
mul r1.xyz, v2, c13.w
mul r0.xyz, r0, v5
max oD0.w, r1, c20.x
mul oD0.xyz, r0, c23.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedoiommgdmaebfnnhccpoapmohicaoklckabaaaaaanmakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcceajaaaaeaaaabaaejacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaa
agbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
abaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaa
agacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaajhcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaai
iccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaacaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedbdnpamfbigfpglnfbckjkkdaefdohpogabaaaaaamebaaaaaaeaaaaaa
daaaaaaabeagaaaaeaapaaaaaibaaaaaebgpgodjnmafaaaanmafaaaaaaacpopp
gaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaafaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
bcaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabbaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabdaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabeaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabbaaffkaafaaaaadacaaapiaabaaffiabfaajeka
aeaaaaaeabaaapiaabaaaaiabjaaoekaacaaoeiaabaaaaacacaaabiabbaaaaka
aeaaaaaeabaaapiaacaaaaiabgaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabhaaaakabhaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bfaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabhaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabhaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabiaajakaafaaaaadaaaaaiiaaaaappiabiaappka
ajaaaaadabaaabiaacaaoeiabkaaoekaajaaaaadabaaaeiaacaaoeiablaaoeka
aeaaaaaeaaaaafiaabaaoeiabbaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeia
bcaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaib
bbaappkaafaaaaadabaaabiaabaaaaiabcaappkaacaaaaadabaaabiaabaaaaia
abaaaaiaalaaaaadabaaabiaabaaaaiabmaakkkaakaaaaadabaaaioaabaaaaia
bmaappkaabaaaaacabaaabiabmaaaakaacaaaaadabaaahiaabaaaaiabaaaoeka
aeaaaaaeabaaahiaaaaappiaabaaoeiabmaaffkaacaaaaadabaaahiaabaaoeia
abaaoeiaafaaaaadabaaahoaabaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadabaaahiaacaaoejaapaappkaafaaaaadacaaahia
abaaffiaamaaoekaaeaaaaaeabaaaliaalaakekaabaaaaiaacaakeiaaeaaaaae
acaaahoaanaaoekaabaakkiaabaapeiaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaanaaoeka
aaaakkiaabaaoeiaaeaaaaaeabaaahiaaoaaoekaaaaappjaabaaoeiaacaaaaad
adaaahoaabaaoeibagaaoekaafaaaaadabaaapiaaaaaffiaamaaoekaafaaaaad
acaaapiaaaaaffiaaiaaoekaaeaaaaaeacaaapiaahaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaajaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaakaaoeka
aaaappjaacaaoeiaaeaaaaaeabaaapiaalaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaae
aeaaahoaaeaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaadmaacaappiaaaaaoeka
acaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefcceajaaaaeaaaabaa
ejacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaa
adaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
igaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaa
fgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaa
abaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
aaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaaaaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaj
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaapgapbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadiaaaaaipcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaafgafbaaaacaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
acaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaacaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[28] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[22];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[21], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[22].w;
ADD R0, R0, -c[23].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[23].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[23].z, R0;
MAD R0, R1, c[23].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[25];
DP4 R2.y, R1, c[24];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
DP4 R2.w, R1, c[8];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 result.texcoord[3].y, R2, c[10];
DP4 result.texcoord[3].x, R2, c[9];
ADD R2.xyz, R1, -c[17];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[16].w;
MUL R2.x, R2, c[17].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[27].x;
MOV R1.x, c[26].w;
ADD R1.xyz, -R1.x, c[15];
DP4 R0.x, R0, c[26].xxyz;
MAD R0.xyz, R0.x, R1, c[26].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[27].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 59 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_CameraRight]
Vector 18 [_CameraUp]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c21, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c22, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c23, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c24, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c25, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c26, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c27, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c16
dp3 r0.x, r0, r0
slt r0.x, c15.w, r0
max r0.x, -r0, r0
slt r0.x, c20, r0
add r0.x, -r0, c20.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c17, v0
mad r3.xyz, r0.y, c18, r1
mul r0.x, r3.z, c15.y
mul r1.xyz, r0.x, c21
mul r0.x, r3, c15.y
mad r0, r0.x, c22, r1.xyyz
mov r1.x, c15
mad r0, c23, r1.x, r0
frc r0, r0
mad r0, r0, c20.z, c20.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c21.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c24.x, r0
mad r0, r1, c24.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c26
dp4 r2.y, r1, c25
mad r1.xz, -r2.xyyw, c15.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
dp4 r2.w, r1, c7
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 oT3.y, r2, c9
dp4 oT3.x, r2, c8
add r2.xyz, r1, -c16
dp3 r2.x, r2, r2
add r2.x, -r2, c15.w
mul r2.x, r2, c16.w
mul r1.w, r2.x, c23.y
mov r1.xyz, c14
min r1.w, r1, c20.y
add r1.xyz, c24.z, r1
dp4 r0.x, r0, c27.xxyz
mad r0.xyz, r0.x, r1, c24.w
mul r1.xyz, v2, c13.w
mul r0.xyz, r0, v5
max oD0.w, r1, c20.x
mul oD0.xyz, r0, c23.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c12
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedlobdkhccfdkandelgclhhgablocdkpifabaaaaaadiakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciaaiaaaaeaaaabaacaacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaa
aaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaa
agbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
abaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaa
agacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaaaaaaaaajhcaabaaa
acaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaai
iccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaidcaabaaaaaaaaaaa
fgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaaegaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaabaaaaaaegaabaaa
aaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaa
abaaaaaaagaebaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedmmgdgnmpfcaiocoapagffhgnnlljhmnlabaaaaaanaapaaaaaeaaaaaa
daaaaaaameafaaaaemaoaaaabeapaaaaebgpgodjimafaaaaimafaaaaaaacpopp
baafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaafaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
bcaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabbaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabdaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabeaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabbaaffkaafaaaaadacaaapiaabaaffiabfaajeka
aeaaaaaeabaaapiaabaaaaiabjaaoekaacaaoeiaabaaaaacacaaabiabbaaaaka
aeaaaaaeabaaapiaacaaaaiabgaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabhaaaakabhaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bfaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabhaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabhaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabiaajakaafaaaaadaaaaaiiaaaaappiabiaappka
ajaaaaadabaaabiaacaaoeiabkaaoekaajaaaaadabaaaeiaacaaoeiablaaoeka
aeaaaaaeaaaaafiaabaaoeiabbaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeia
bcaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaib
bbaappkaafaaaaadabaaabiaabaaaaiabcaappkaacaaaaadabaaabiaabaaaaia
abaaaaiaalaaaaadabaaabiaabaaaaiabmaakkkaakaaaaadabaaaioaabaaaaia
bmaappkaabaaaaacabaaabiabmaaaakaacaaaaadabaaahiaabaaaaiabaaaoeka
aeaaaaaeabaaahiaaaaappiaabaaoeiabmaaffkaacaaaaadabaaahiaabaaoeia
abaaoeiaafaaaaadabaaahoaabaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadabaaahiaacaaoejaapaappkaafaaaaadacaaahia
abaaffiaamaaoekaaeaaaaaeabaaaliaalaakekaabaaaaiaacaakeiaaeaaaaae
acaaahoaanaaoekaabaakkiaabaapeiaafaaaaadabaaapiaaaaaffiaamaaoeka
afaaaaadacaaapiaaaaaffiaaiaaoekaaeaaaaaeacaaapiaahaaoekaaaaaaaia
acaaoeiaaeaaaaaeacaaapiaajaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapia
akaaoekaaaaappjaacaaoeiaaeaaaaaeabaaapiaalaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaapiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaappjaaaaaoeiaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadia
abaaobkaaaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeia
aeaaaaaeaaaaamoaaeaabekaaaaappiaaaaaeeiaaeaaaaaeaaaaadmaacaappia
aaaaoekaacaaoeiaabaaaaacaaaaammaacaaoeiaabaaaaacadaaahoaagaaoeka
ppppaaaafdeieefciaaiaaaaeaaaabaacaacaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaa
aaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaan
pcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaa
kgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
adaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaaidcaabaaaaaaaaaaafgafbaaaabaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaabaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaabaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
abaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaabaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaa
abaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[1];
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
KIL -R1.x;
TEX R0.w, R0.w, texture[1], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[2];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s0
mul r2, r0, v0
add_pp r0.x, r2.w, -c1
cmp r1.x, r0, c2, c2.y
mov_pp r1, -r1.x
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mul_pp r2.xyz, r2, c0
texld r0, r0, s1
texkill r1.xyzw
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
max_pp r1.x, r1, c2
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c2.z
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeifalfopkjlogeffdmlaopodmncniddoabaaaaaaimadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
giacaaaaeaaaaaaajkaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaa
aeaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedckbpcnekakolgcjjppkbdpfimlhphnhbabaaaaaaeaafaaaaaeaaaaaa
daaaaaaaoaabaaaafaaeaaaaamafaaaaebgpgodjkiabaaaakiabaaaaaaacpppp
geabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapiaaaaaoelaabaioekaaeaaaaae
abaacpiaaaaappiaabaapplaabaaaakbafaaaaadaaaachiaaaaaoeiaabaaoela
afaaaaadaaaachiaaaaaoeiaaaaaoekaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacacaaadiaaaaappiaebaaaaababaaapiaecaaaaadabaacpiaacaaoeia
aaaioekaceaaaaacacaachiaadaaoelaaiaaaaadaaaaciiaacaaoelaacaaoeia
afaaaaadabaacbiaabaaaaiaaaaappiafiaaaaaeaaaaciiaaaaappiaabaaaaia
acaaaakaacaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaabaaaaacaaaaciiaacaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcgiacaaaaeaaaaaaajkaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.color.primary;
SLT R0.w, R0, c[1].x;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
KIL -R0.w;
DP3 R0.w, fragment.texcoord[1], R1;
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c1
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul_pp r1.xyz, r1, c0
texkill r0.xyzw
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
max_pp r0.x, r0, c2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.z
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedipkopipeffgkepljihfojbedbplegnhnabaaaaaamaacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmejphjhdiihdejkimfoaffdcfdjibaffabaaaaaabiaeaaaaaeaaaaaa
daaaaaaaieabaaaaeaadaaaaoeadaaaaebgpgodjemabaaaaemabaaaaaaacpppp
amabaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoelaaaaioeka
aeaaaaaeabaacpiaaaaappiaabaapplaabaaaakbafaaaaadaaaachiaaaaaoeia
abaaoelaafaaaaadaaaachiaaaaaoeiaaaaaoekaebaaaaababaaapiaabaaaaac
abaaahiaacaaoelaaiaaaaadaaaaciiaabaaoeiaadaaoelaalaaaaadabaacbia
aaaappiaacaaaakaacaaaaadaaaaciiaabaaaaiaabaaaaiaafaaaaadaaaachia
aaaappiaaaaaoeiaabaaaaacaaaaaiiaacaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
jfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.color.primary;
SLT R0.w, R0, c[1].x;
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
RCP R1.x, fragment.texcoord[3].w;
MAD R1.xy, fragment.texcoord[3], R1.x, c[2].y;
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
KIL -R0.w;
TEX R0.w, R1, texture[1], 2D;
TEX R1.w, R1.z, texture[2], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
SLT R1.y, c[2].x, fragment.texcoord[3].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.00000000, 1.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r0, t0, s0
mul r2, r0, v0
add_pp r0.x, r2.w, -c1
cmp r0.x, r0, c2, c2.y
mov_pp r3, -r0.x
dp3 r1.x, t3, t3
rcp r0.x, t3.w
mad r0.xy, t3, r0.x, c2.z
mov r1.xy, r1.x
mul_pp r2.xyz, r2, c0
texld r0, r0, s1
texkill r3.xyzw
texld r3, r1, s2
dp3_pp r1.x, t2, t2
cmp r0.x, -t3.z, c2, c2.y
mul_pp r0.x, r0, r0.w
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
mul_pp r0.x, r0, r3
max_pp r1.x, r1, c2
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c2.w
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedehafpjflecijjeimccijminipbfaolkjabaaaaaaiaaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
fmadaaaaeaaaaaaanhaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaah
icaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaa
dkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaa
abaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmhcfmplciampnkgnllfemdaeibebjchgabaaaaaajeagaaaaaeaaaaaa
daaaaaaaeaacaaaakeafaaaagaagaaaaebgpgodjaiacaaaaaiacaaaaaaacpppp
maabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaad
aaaaapiaaaaaoelaacaioekaaeaaaaaeabaacpiaaaaappiaabaapplaabaaaakb
afaaaaadaaaachiaaaaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaaaaaoeka
agaaaaacaaaaaiiaaeaapplaaeaaaaaeacaaadiaaeaaoelaaaaappiaacaaaaka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacadaaadiaaaaappiaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaaaaioekaecaaaaadacaacpiaadaaoeia
abaioekaafaaaaadaaaaciiaabaappiaacaaaaiafiaaaaaeaaaaciiaaeaakklb
acaaffkaaaaappiaceaaaaacabaachiaadaaoelaaiaaaaadabaacbiaacaaoela
abaaoeiaalaaaaadacaacbiaabaaaaiaacaaffkaafaaaaadaaaaciiaaaaappia
acaaaaiaacaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaabaaaaacaaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcfmadaaaaeaaaaaaanhaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
dbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
agaabaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[2], CUBE;
MUL R0, R0, fragment.color.primary;
SLT R1.x, R0.w, c[1];
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[2].x;
KIL -R1.x;
TEX R0.w, R0.w, texture[1], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c2, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s0
mul r2, r0, v0
add_pp r0.x, r2.w, -c1
cmp r1.x, r0, c2, c2.y
mov_pp r1, -r1.x
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mul_pp r2.xyz, r2, c0
texld r0, r0, s1
texkill r1.xyzw
texld r1, t3, s2
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
mul r0.x, r0, r1.w
max_pp r1.x, r1, c2
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c2.z
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedikijbieiolokdhhblgaechhhcngajobiabaaaaaaoiadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
meacaaaaeaaaaaaalbaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
agaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaaapaaaaahicaabaaa
aaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaljepcejgmaniklefinmlpkcclamjmphabaaaaaamiafaaaaaeaaaaaa
daaaaaaaamacaaaaniaeaaaajeafaaaaebgpgodjneabaaaaneabaaaaaaacpppp
imabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaaji
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaad
aaaaapiaaaaaoelaacaioekaaeaaaaaeabaacpiaaaaappiaabaapplaabaaaakb
afaaaaadaaaachiaaaaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaaaaaoeka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacacaaadiaaaaappiaebaaaaab
abaaapiaecaaaaadabaaapiaacaaoeiaabaioekaecaaaaadacaaapiaaeaaoela
aaaioekaafaaaaadaaaaciiaabaaaaiaacaappiaceaaaaacabaachiaadaaoela
aiaaaaadabaacbiaacaaoelaabaaoeiaalaaaaadacaacbiaabaaaaiaacaaaaka
afaaaaadaaaaciiaaaaappiaacaaaaiaacaaaaadaaaaciiaaaaappiaaaaappia
afaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciiaacaaaakaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcmeacaaaaeaaaaaaalbaaaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaalicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
adaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
dkaabaaaacaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.color.primary;
SLT R0.w, R0, c[1].x;
MOV R1.xyz, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[2];
MOV result.color.w, c[2].x;
KIL -R0.w;
TEX R0.w, fragment.texcoord[3], texture[1], 2D;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c1
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul_pp r1.xyz, r1, c0
texkill r0.xyzw
texld r0, t3, s1
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r0.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.z
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgdapaklchnkmolfoeieogkgdgmlmdhaaabaaaaaaceadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aaacaaaaeaaaaaaaiaaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
pgapbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedglambicjgejdbogjhhfmokjcgehilllpabaaaaaalmaeaaaaaeaaaaaa
daaaaaaameabaaaammadaaaaiiaeaaaaebgpgodjimabaaaaimabaaaaaaacpppp
eiabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
ecaaaaadaaaaapiaaaaaoelaabaioekaaeaaaaaeabaacpiaaaaappiaabaappla
abaaaakbafaaaaadaaaachiaaaaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeia
aaaaoekaabaaaaacacaaadiaaaaabllaebaaaaababaaapiaecaaaaadabaacpia
acaaoeiaaaaioekaabaaaaacabaaahiaacaaoelaaiaaaaadaaaaciiaabaaoeia
adaaoelaafaaaaadabaacbiaabaappiaaaaappiafiaaaaaeaaaaciiaaaaappia
abaaaaiaacaaaakaacaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachia
aaaappiaaaaaoeiaabaaaaacaaaaciiaacaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcaaacaaaaeaaaaaaaiaaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaiaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadbaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaapgapbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..15],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[12];
DP3 R0.x, R0, R0;
SLT R0.x, c[11].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[13], vertex.position;
MAD R3.xyz, R0.y, c[14], R1;
MUL R0.x, R3.z, c[11].y;
MUL R1.xyz, R0.x, c[17];
MUL R0.x, R3, c[11].y;
MAD R1, R0.x, c[16], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[17].w;
ADD R0, R0, -c[18].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[18].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[18].z, R0;
MAD R0, R1, c[18].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[20];
DP4 R2.y, R1, c[19];
MAD R1.xz, -R2.xyyw, c[11].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R2.xyz, R1, -c[12];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[11].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MUL R2.x, R2, c[12].w;
MUL R1.y, R2.x, c[0];
MIN R1.w, R1.y, c[22].x;
MOV R1.x, c[21].w;
ADD R1.xyz, -R1.x, c[10];
DP4 R0.x, R0, c[21].xxyz;
MAD R0.xyz, R0.x, R1, c[21].w;
MUL R1.xyz, vertex.normal, c[9].w;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R1, c[22].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
END
# 52 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_CameraRight]
Vector 13 [_CameraUp]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c16, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c17, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c18, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c19, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c20, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c21, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c22, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c11
dp3 r0.x, r0, r0
slt r0.x, c10.w, r0
max r0.x, -r0, r0
slt r0.x, c15, r0
add r0.x, -r0, c15.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c12, v0
mad r3.xyz, r0.y, c13, r1
mul r0.x, r3.z, c10.y
mul r1.xyz, r0.x, c16
mul r0.x, r3, c10.y
mad r0, r0.x, c17, r1.xyyz
mov r1.x, c10
mad r0, c18, r1.x, r0
frc r0, r0
mad r0, r0, c15.z, c15.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c16.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c19.x, r0
mad r0, r1, c19.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c21
dp4 r2.y, r1, c20
mad r1.xz, -r2.xyyw, c10.z, r3
mov r1.y, r3
mov r1.w, v0
add r2.xyz, r1, -c11
dp3 r2.x, r2, r2
add r2.x, -r2, c10.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mul r2.x, r2, c11.w
mul r1.w, r2.x, c18.y
mov r1.xyz, c9
min r1.w, r1, c15.y
add r1.xyz, c19.z, r1
dp4 r0.x, r0, c22.xxyz
mad r0.xyz, r0.x, r1, c19.w
mul r1.xyz, v2, c8.w
mul r0.xyz, r0, v5
max oD0.w, r1, c15.x
mul oD0.xyz, r0, c18.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c14, c14.zwzw
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedialbnmggljegblgikcegdhhneafcgbdkabaaaaaajiaiaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcbaahaaaaeaaaabaameabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabfaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
acaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
acaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaacaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaacaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaacaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedhiomjjpaobofbmokpolpkpnanbhkhemaabaaaaaaheanaaaaaeaaaaaa
daaaaaaaaiafaaaacaamaaaaoiamaaaaebgpgodjnaaeaaaanaaeaaaaaaacpopp
gmaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaamaaadaaagaaaaaaaaaa
abaabeaaabaaajaaaaaaaaaaacaaaaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbaaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbbaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbcaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafbdaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbeaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbfaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbgaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaad
aaaaahiaaaaaoejaamaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaad
aaaaabiaalaappkaaaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoeja
aeaaaaaeaaaaaniaaaaaaaiaanaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffia
aoaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiiaalaaffkaafaaaaadacaaapia
abaaffiaapaajekaaeaaaaaeabaaapiaabaaaaiabdaaoekaacaaoeiaabaaaaac
acaaabiaalaaaakaaeaaaaaeabaaapiaacaaaaiabaaaoekaabaaoeiabdaaaaac
abaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeiabbaaaakabbaaffkaafaaaaad
acaaapiaabaaoeiaabaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaae
abaaapiaadaaoeiaapaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeia
afaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabbaakkka
abaaoeiaaeaaaaaeabaaapiaacaaoeiabbaappkaabaaoeiaafaaaaadabaaapia
abaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapia
abaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeiabcaajakaafaaaaadaaaaaiia
aaaappiabcaappkaajaaaaadabaaabiaacaaoeiabeaaoekaajaaaaadabaaaeia
acaaoeiabfaaoekaaeaaaaaeaaaaafiaabaaoeiaalaakkkbaaaaoeiaafaaaaad
abaaapiaaaaaffiaadaaoekaaeaaaaaeabaaapiaacaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaaeaaoekaaaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeia
amaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaib
alaappkaafaaaaadaaaaabiaaaaaaaiaamaappkaacaaaaadaaaaabiaaaaaaaia
aaaaaaiaalaaaaadaaaaabiaaaaaaaiabgaakkkaakaaaaadabaaaioaaaaaaaia
bgaappkaaeaaaaaeabaaapiaafaaoekaaaaappjaabaaoeiaabaaaaacaaaaabia
bgaaaakaacaaaaadaaaaahiaaaaaaaiaakaaoekaaeaaaaaeaaaaahiaaaaappia
aaaaoeiabgaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoa
aaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejaajaappkaafaaaaadacaaahiaaaaaffiaahaaoekaaeaaaaae
aaaaaliaagaakekaaaaaaaiaacaakeiaaeaaaaaeacaaahoaaiaaoekaaaaakkia
aaaapeiaaeaaaaaeaaaaadmaabaappiaaaaaoekaabaaoeiaabaaaaacaaaaamma
abaaoeiappppaaaafdeieefcbaahaaaaeaaaabaameabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafjaaaaaeegiocaaa
acaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaacaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
acaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaacaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaa
pgipcaaaacaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaabaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5 } };
TEMP R0;
TEX R0.w, fragment.texcoord[0], texture[0], 2D;
MUL R0.x, R0.w, fragment.color.primary.w;
SLT R0.x, R0, c[0];
MAD result.color.xyz, fragment.texcoord[1], c[1].y, c[1].y;
MOV result.color.w, c[1].x;
KIL -R0.x;
END
# 6 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 1.00000000, 0.50000000, 0
dcl t0.xy
dcl v0.xyzw
dcl t1.xyz
texld r0, t0, s0
mul r0.w, r0, v0
add_pp r0.x, r0.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
mad_pp r0.xyz, t1, c1.z, c1.z
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhpedlkemeddlaiicjlkbdenlhlbkdbkjabaaaaaacmacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcdiabaaaaeaaaaaaaeoaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaadcaaaaaphccabaaa
aaaaaaaaegbcbaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedekkdkacjljlfmcloebhgnlngnmcfiaogabaaaaaabeadaaaaaeaaaaaa
daaaaaaabeabaaaafeacaaaaoaacaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
kiaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaaeaaaaaeaaaacpiaaaaappiaabaapplaaaaaaakbebaaaaab
aaaaapiaaeaaaaaeaaaachiaacaaoelaabaaaakaabaaaakaabaaaaacaaaaciia
abaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiabaaaaeaaaaaaa
eoaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaa
dcaaaaaphccabaaaaaaaaaaaegbcbaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaiaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  ZWrite Off
  Cull Off
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..23],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.xyz, vertex.position, -c[20];
DP3 R0.x, R0, R0;
SLT R0.x, c[19].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[21], vertex.position;
MAD R3.xyz, R0.y, c[22], R1;
MUL R0.x, R3.z, c[19].y;
MUL R1.xyz, R0.x, c[25];
MUL R0.x, R3, c[19].y;
MAD R1, R0.x, c[24], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
FRC R0, R0;
MUL R0, R0, c[25].w;
ADD R1, R0, -c[26].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[26].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[26].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[26].y, R1;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[29].xxyz;
DP4 R2.x, R1, c[28];
DP4 R2.y, R1, c[27];
MAD R1.xz, -R2.xyyw, c[19].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R3.xyz, R1, -c[20];
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R4.xyz, R2.xyww, c[29].w;
MUL R4.y, R4, c[9].x;
DP3 R3.x, R3, R3;
ADD R1.x, -R3, c[19].w;
MUL R1.x, R1, c[20].w;
MUL R1.y, R1.x, c[0];
MIN R1.w, R1.y, c[30].x;
MOV R1.x, c[29].w;
ADD R1.xyz, -R1.x, c[18];
MAD R0.xyz, R0.x, R1, c[29].w;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].zw, R2;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[30].x;
MAX result.color.w, R1, c[30].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[15];
DP4 R0.y, R1, c[14];
DP4 R0.x, R1, c[13];
MUL R1.xyz, R0.w, c[16];
ADD R0.xyz, R2, R0;
ADD result.texcoord[1].xy, R4, R4.z;
ADD result.texcoord[2].xyz, R0, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 71 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c25, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c26, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c27, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c28, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c29, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c30, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c31, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c20
dp3 r0.x, r0, r0
slt r0.x, c19.w, r0
max r0.x, -r0, r0
slt r0.x, c24, r0
add r0.x, -r0, c24.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c21, v0
mad r3.xyz, r0.y, c22, r1
mul r0.x, r3.z, c19.y
mul r1.xyz, r0.x, c25
mul r0.x, r3, c19.y
mad r1, r0.x, c26, r1.xyyz
mov r0.x, c19
mad r0, c27, r0.x, r1
frc r0, r0
mad r1, r0, c24.z, c24.w
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c25.w, r1
mul r2, r2, r0
mad r1, r2, c28.x, r1
mul r0, r2, r0
mad r0, r0, c28.y, r1
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c31.xxyz
dp4 r2.x, r1, c30
dp4 r2.y, r1, c29
mad r1.xz, -r2.xyyw, c19.z, r3
mov r1.y, r3
mov r1.w, v0
add r3.xyz, r1, -c20
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r4.xyz, r2.xyww, c28.w
mul r4.y, r4, c8.x
dp3 r3.x, r3, r3
add r1.x, -r3, c19.w
mul r1.x, r1, c20.w
mul r1.w, r1.x, c27.y
min r1.w, r1, c24.y
mov r1.xyz, c18
add r1.xyz, c28.z, r1
mad r0.xyz, r0.x, r1, c28.w
mul r0.xyz, r0, v5
mov oPos, r2
mul r1.xyz, v2, c17.w
mul oD0.xyz, r0, c27.y
mov oT1.zw, r2
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c24.y
max oD0.w, r1, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c15
dp4 r0.y, r1, c14
dp4 r0.x, r1, c13
mul r1.xyz, r0.w, c16
add r0.xyz, r2, r0
mad oT1.xy, r4.z, c9.zwzw, r4
add oT2.xyz, r0, r1
mad oT0.xy, v3, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmllaffapmnimekdgjdkiilfdmmbkifjcabaaaaaapmakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcfmajaaaa
eaaaabaafhacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaai
bcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaam
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaap
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaaeaaaaaa
abaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaaeaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjemlcgpjckblifbkgimjjdnidnbkkaneabaaaaaapabaaaaaaeaaaaaa
daaaaaaacaagaaaaieapaaaaembaaaaaebgpgodjoiafaaaaoiafaaaaaaacpopp
gmafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaafaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbiaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbjaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbkaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafblaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbmaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafbnaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafboaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
beaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabdaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabfaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabgaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabdaaffkaafaaaaadacaaapiaabaaffiabjaajeka
aeaaaaaeabaaapiaabaaaaiablaaoekaacaaoeiaabaaaaacacaaabiabdaaaaka
aeaaaaaeabaaapiaacaaaaiabhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabiaaaakabiaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bjaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabiaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabkaajakaafaaaaadaaaaaiiaaaaappiabkaappka
ajaaaaadabaaabiaacaaoeiabmaaoekaajaaaaadabaaaeiaacaaoeiabnaaoeka
aeaaaaaeaaaaafiaabaaoeiabdaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffia
alaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapia
amaaoekaaaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiabeaaoekbaiaaaaad
aaaaabiaaaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibbdaappkaafaaaaad
aaaaabiaaaaaaaiabeaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaad
aaaaabiaaaaaaaiaboaakkkaakaaaaadabaaaioaaaaaaaiaboaappkaaeaaaaae
abaaapiaanaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaboaaaakaacaaaaad
aaaaahiaaaaaaaiabcaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaboaaffka
acaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoeja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaabaapeia
boaaffkaafaaaaadaaaaaiiaaaaaffiaacaaaakaacaaaaadacaaadoaaaaakkia
aaaaomiaafaaaaadaaaaahiaacaaoejabbaappkaafaaaaadacaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
baaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiaboaappkaajaaaaadacaaabia
adaaoekaaaaaoeiaajaaaaadacaaaciaaeaaoekaaaaaoeiaajaaaaadacaaaeia
afaaoekaaaaaoeiaafaaaaadadaaapiaaaaacjiaaaaakeiaajaaaaadaeaaabia
agaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaadaeaaaeia
aiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaacia
aaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaae
adaaahoaajaaoekaaaaaaaiaacaaoeiaaeaaaaaeaaaaadmaabaappiaaaaaoeka
abaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeiappppaaaa
fdeieefcfmajaaaaeaaaabaafhacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaa
aeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaa
aaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaa
abaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaan
pcaabaaaabaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaa
kgikcaaaaeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaa
acaaaaaapgipcaaaaeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..21],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[23];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[22], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[23].w;
ADD R1, R0, -c[24].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[24].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[24].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[24].y, R1;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[27].xxyz;
MOV R0.w, c[28].x;
DP4 R2.x, R1, c[26];
DP4 R2.y, R1, c[25];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R3.xyz, R1, -c[17];
DP3 R3.x, R3, R3;
DP4 R2.w, R1, c[8];
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MUL R4.xyz, R2.xyww, c[27].w;
MOV result.position, R2;
MOV result.texcoord[1].zw, R2;
MUL R4.y, R4, c[13].x;
ADD R3.x, -R3, c[16].w;
MUL R2.x, R3, c[17].w;
MUL R2.w, R2.x, c[0].y;
MIN R2.w, R2, c[28].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP4 R1.w, R1, c[3];
ADD R2.xyz, R2, -c[14];
MOV R1.x, c[27].w;
ADD R1.xyz, -R1.x, c[15];
MAD R0.xyz, R0.x, R1, c[27].w;
ADD R0.w, R0, -c[14];
MUL R0.xyz, R0, vertex.color;
ADD result.texcoord[1].xy, R4, R4.z;
MUL result.texcoord[3].xyz, R2, c[14].w;
MAX result.color.w, R2, c[28].y;
MUL result.texcoord[3].w, -R1, R0;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[20], c[20].zwzw;
END
# 63 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00000000, 0.00600000, 0.02000000, 0.05000000
def c23, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c24, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c25, 6.40884876, -3.14159274, -0.16161616, 0.00833330
def c26, -0.00019841, 0.47193992, 0.18877596, 0.09438798
def c27, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c28, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c29, -0.50000000, 0.50000000, 1.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c17
dp3 r0.x, r0, r0
slt r0.x, c16.w, r0
max r0.x, -r0, r0
slt r0.x, c22, r0
add r0.x, -r0, c29.z
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c18, v0
mad r3.xyz, r0.y, c19, r1
mul r0.x, r3.z, c16.y
mul r1.xyz, r0.x, c22.yzww
mul r0.x, r3, c16.y
mad r1, r0.x, c23, r1.xyyz
mov r0.x, c16
mad r0, c24, r0.x, r1
frc r0, r0
mad r1, r0, c25.x, c25.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c25.z, r1
mul r2, r2, r0
mad r1, r2, c25.w, r1
mul r0, r2, r0
mad r0, r0, c26.x, r1
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c26.yyzw
mov r0.w, c14
dp4 r2.x, r1, c28
dp4 r2.y, r1, c27
mad r1.xz, -r2.xyyw, c16.z, r3
mov r1.y, r3
mov r1.w, v0
add r3.xyz, r1, -c17
dp3 r3.x, r3, r3
dp4 r2.w, r1, c7
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
mul r4.xyz, r2.xyww, c29.y
mov oPos, r2
mov oT1.zw, r2
mul r4.y, r4, c12.x
add r3.x, -r3, c16.w
mul r2.x, r3, c17.w
mul r2.w, r2.x, c24.y
min r2.w, r2, c29.z
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
dp4 r1.w, r1, c2
add r2.xyz, r2, -c14
mov r1.xyz, c15
add r1.xyz, c29.x, r1
mad r0.xyz, r0.x, r1, c29.y
add r0.w, c29.z, -r0
mul r0.xyz, r0, v5
mad oT1.xy, r4.z, c13.zwzw, r4
mul oT3.xyz, r2, c14.w
max oD0.w, r2, c22.x
mul oT3.w, -r1, r0
mul oD0.xyz, r0, c24.y
mad oT0.xy, v3, c21, c21.zwzw
mad oT2.xy, v4, c20, c20.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedniobllcgcgiclbebnflknccfbigfdoibabaaaaaapmakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceeajaaaaeaaaabaafbacaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaa
fjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacaeaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
aeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaa
egiccaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaa
dcaaaaamhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaacaaaaaa
egbcbaaaafaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaaeaaaaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
dkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaaeaaaaaa
acaaaaaapgapbaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaaabaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
abaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
agajbaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaagaobaaaaaaaaaaaaaaaaaajncaabaaaaaaaaaaaagaobaaa
aaaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaa
igadbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaaaaaaaaajbcaabaaaaaaaaaaa
dkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaa
aeaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedneikncbaahobjfelmfcikiiedpeakldkabaaaaaamebaaaaaaeaaaaaa
daaaaaaapeafaaaaeaapaaaaaibaaaaaebgpgodjlmafaaaalmafaaaaaaacpopp
emafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaeaaaaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafbhaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
biaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbjaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbkaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafblaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
bmaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbnaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejabdaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaamaaaaadaaaaabiabcaappkaaaaaaaiaaeaaaaaeaaaaadia
aaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiabeaajekaaaaajeja
aeaaaaaeaaaaahiaaaaaffiabfaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiia
bcaaffkaafaaaaadacaaapiaabaaffiabgaajekaaeaaaaaeabaaapiaabaaaaia
bkaaoekaacaaoeiaabaaaaacacaaabiabcaaaakaaeaaaaaeabaaapiaacaaaaia
bhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
biaaaakabiaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapia
abaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiabgaappkaabaaoeiaafaaaaad
adaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaae
abaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiabiaappka
abaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeia
abaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeia
bjaajakaafaaaaadaaaaaiiaaaaappiabjaappkaajaaaaadabaaabiaacaaoeia
blaaoekaajaaaaadabaaaeiaacaaoeiabmaaoekaaeaaaaaeaaaaafiaabaaoeia
bcaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeiabdaaoekbaiaaaaadabaaabia
abaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaibbcaappkaafaaaaadabaaabia
abaaaaiabdaappkaacaaaaadabaaabiaabaaaaiaabaaaaiaalaaaaadabaaabia
abaaaaiabnaakkkaakaaaaadabaaaioaabaaaaiabnaappkaabaaaaacabaaajia
bnaaoekaacaaaaadabaaahiaabaaaaiabbaaoekaaeaaaaaeabaaahiaaaaappia
abaaoeiabnaaffkaacaaaaadabaaahiaabaaoeiaabaaoeiaafaaaaadabaaahoa
abaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaafaaaaad
acaaapiaaaaaffiaagaaoekaaeaaaaaeacaaapiaafaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaahaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaaiaaoeka
aaaappjaacaaoeiaafaaaaadadaaahiaacaapeiabnaaffkaafaaaaadadaaaiia
adaaffiaadaaaakaacaaaaadacaaadoaadaakkiaadaaomiaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffiaaoaaoekaafaaaaad
aaaaaciaaaaaffiaakaakkkaaeaaaaaeaaaaaciaajaakkkaaaaaaaiaaaaaffia
aeaaaaaeaaaaaciaalaakkkaaaaakkiaaaaaffiaaeaaaaaeaaaaaciaamaakkka
aaaappjaaaaaffiaaeaaaaaeabaaahiaanaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaaniaapaajekaaaaakkiaabaajeiaaeaaaaaeaaaaaniabaaajekaaaaappja
aaaaoeiaacaaaaadaaaaaniaaaaaoeiaaeaajekbafaaaaadadaaahoaaaaapiia
aeaappkaacaaaaadaaaaabiaabaappiaaeaappkbafaaaaadadaaaioaaaaaaaia
aaaaffibaeaaaaaeaaaaadmaacaappiaaaaaoekaacaaoeiaabaaaaacaaaaamma
acaaoeiaabaaaaacacaaamoaacaaoeiappppaaaafdeieefceeajaaaaeaaaabaa
fbacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaa
baaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaa
aeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaa
aaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaa
abaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaan
pcaabaaaabaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaa
kgikcaaaaeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaa
acaaaaaaegiccaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
acaaaaaaegbcbaaaafaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaapgapbaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaa
abaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaa
acaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaagajbaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaagaobaaaaaaaaaaaaaaaaaajncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaa
aeaaaaaaigadbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaaaaaaaaajbcaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 5 [_ProjectionParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_CameraRight]
Vector 10 [_CameraUp]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[20] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..12],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[8];
DP3 R0.x, R0, R0;
SLT R0.x, c[7].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[9], vertex.position;
MAD R3.xyz, R0.y, c[10], R1;
MUL R0.x, R3.z, c[7].y;
MUL R1.xyz, R0.x, c[14];
MUL R0.x, R3, c[7].y;
MAD R1, R0.x, c[13], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[14].w;
ADD R0, R0, -c[15].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[15].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[15].z, R0;
MAD R0, R1, c[15].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[17];
DP4 R2.y, R1, c[16];
MAD R1.xz, -R2.xyyw, c[7].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[18].w;
MUL R3.y, R3, c[5].x;
ADD result.texcoord[1].xy, R3, R3.z;
ADD R3.xyz, R1, -c[8];
DP3 R1.x, R3, R3;
ADD R1.x, -R1, c[7].w;
MUL R1.y, R1.x, c[8].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[18].xxyz;
MOV R1.x, c[18].w;
ADD R1.xyz, -R1.x, c[6];
MAD R0.xyz, R0.x, R1, c[18].w;
MIN R0.w, R1, c[19].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MOV result.texcoord[1].zw, R2;
MAX result.color.w, R0, c[19].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[11], c[11].zwzw;
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_CameraRight]
Vector 10 [_CameraUp]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c14, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c15, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c16, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c17, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c18, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c19, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c20, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c8
dp3 r0.x, r0, r0
slt r0.x, c7.w, r0
max r0.x, -r0, r0
slt r0.x, c13, r0
add r0.x, -r0, c13.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c9, v0
mad r3.xyz, r0.y, c10, r1
mul r0.x, r3.z, c7.y
mul r1.xyz, r0.x, c14
mul r0.x, r3, c7.y
mad r0, r0.x, c15, r1.xyyz
mov r1.x, c7
mad r0, c16, r1.x, r0
frc r0, r0
mad r0, r0, c13.z, c13.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c14.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c17.x, r0
mad r0, r1, c17.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c19
dp4 r2.y, r1, c18
mad r1.xz, -r2.xyyw, c7.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r3.xyz, r2.xyww, c17.w
mul r3.y, r3, c4.x
mad oT1.xy, r3.z, c5.zwzw, r3
add r3.xyz, r1, -c8
dp3 r1.x, r3, r3
add r1.x, -r1, c7.w
mul r1.w, r1.x, c8
mov r1.xyz, c6
dp4 r0.x, r0, c20.xxyz
mul r1.w, r1, c16.y
add r1.xyz, c17.z, r1
mad r0.xyz, r0.x, r1, c17.w
min r0.w, r1, c13.y
mul r0.xyz, r0, v5
mov oPos, r2
mov oT1.zw, r2
max oD0.w, r0, c13.x
mul oD0.xyz, r0, c16.y
mad oT0.xy, v3, c12, c12.zwzw
mad oT2.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecednmmflnldigcniegdjfkmpkfcloommnjeabaaaaaabaajaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchaahaaaa
eaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaa
afaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefieceddoeabhmgkcjedphnmnknmgmbcahnefamabaaaaaaoianaaaaaeaaaaaa
daaaaaaaaeafaaaahmamaaaaeeanaaaaebgpgodjmmaeaaaammaeaaaaaaacpopp
heaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpfbaaaaafaoaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafapaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
baaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbbaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbcaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafbdaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
beaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaakaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaajaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
alaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaamaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiaajaaffkaafaaaaadacaaapiaabaaffiaaoaajekaaeaaaaae
abaaapiaabaaaaiabcaaoekaacaaoeiaabaaaaacacaaabiaajaaaakaaeaaaaae
abaaapiaacaaaaiaapaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiabaaaaakabaaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiaaoaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiabaaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiabaaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiabbaajakaafaaaaadaaaaaiiaaaaappiabbaappkaajaaaaad
abaaabiaacaaoeiabdaaoekaajaaaaadabaaaeiaacaaoeiabeaaoekaaeaaaaae
aaaaafiaabaaoeiaajaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaafaaoeka
aeaaaaaeabaaapiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaagaaoeka
aaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaakaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibajaappkaafaaaaadaaaaabia
aaaaaaiaakaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabia
aaaaaaiaanaakkkaakaaaaadabaaaioaaaaaaaiaanaappkaaeaaaaaeabaaapia
ahaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaanaaaakaacaaaaadaaaaahia
aaaaaaiaaiaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaanaaffkaacaaaaad
aaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaabaapeiaanaaffka
afaaaaadaaaaaiiaaaaaffiaadaaaakaacaaaaadacaaadoaaaaakkiaaaaaomia
aeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadmaabaappia
aaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeia
ppppaaaafdeieefchaahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
afaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..23],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.xyz, vertex.position, -c[20];
DP3 R0.x, R0, R0;
SLT R0.x, c[19].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[21], vertex.position;
MAD R3.xyz, R0.y, c[22], R1;
MUL R0.x, R3.z, c[19].y;
MUL R1.xyz, R0.x, c[25];
MUL R0.x, R3, c[19].y;
MAD R1, R0.x, c[24], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
FRC R0, R0;
MUL R0, R0, c[25].w;
ADD R1, R0, -c[26].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[26].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[26].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[26].y, R1;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[29].xxyz;
DP4 R2.x, R1, c[28];
DP4 R2.y, R1, c[27];
MAD R1.xz, -R2.xyyw, c[19].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R3.xyz, R1, -c[20];
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R4.xyz, R2.xyww, c[29].w;
MUL R4.y, R4, c[9].x;
DP3 R3.x, R3, R3;
ADD R1.x, -R3, c[19].w;
MUL R1.x, R1, c[20].w;
MUL R1.y, R1.x, c[0];
MIN R1.w, R1.y, c[30].x;
MOV R1.x, c[29].w;
ADD R1.xyz, -R1.x, c[18];
MAD R0.xyz, R0.x, R1, c[29].w;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].zw, R2;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[30].x;
MAX result.color.w, R1, c[30].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[15];
DP4 R0.y, R1, c[14];
DP4 R0.x, R1, c[13];
MUL R1.xyz, R0.w, c[16];
ADD R0.xyz, R2, R0;
ADD result.texcoord[1].xy, R4, R4.z;
ADD result.texcoord[2].xyz, R0, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 71 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WavingTint]
Vector 19 [_WaveAndDistance]
Vector 20 [_CameraPosition]
Vector 21 [_CameraRight]
Vector 22 [_CameraUp]
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c25, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c26, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c27, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c28, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c29, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c30, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c31, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c20
dp3 r0.x, r0, r0
slt r0.x, c19.w, r0
max r0.x, -r0, r0
slt r0.x, c24, r0
add r0.x, -r0, c24.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c21, v0
mad r3.xyz, r0.y, c22, r1
mul r0.x, r3.z, c19.y
mul r1.xyz, r0.x, c25
mul r0.x, r3, c19.y
mad r1, r0.x, c26, r1.xyyz
mov r0.x, c19
mad r0, c27, r0.x, r1
frc r0, r0
mad r1, r0, c24.z, c24.w
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c25.w, r1
mul r2, r2, r0
mad r1, r2, c28.x, r1
mul r0, r2, r0
mad r0, r0, c28.y, r1
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c31.xxyz
dp4 r2.x, r1, c30
dp4 r2.y, r1, c29
mad r1.xz, -r2.xyyw, c19.z, r3
mov r1.y, r3
mov r1.w, v0
add r3.xyz, r1, -c20
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r4.xyz, r2.xyww, c28.w
mul r4.y, r4, c8.x
dp3 r3.x, r3, r3
add r1.x, -r3, c19.w
mul r1.x, r1, c20.w
mul r1.w, r1.x, c27.y
min r1.w, r1, c24.y
mov r1.xyz, c18
add r1.xyz, c28.z, r1
mad r0.xyz, r0.x, r1, c28.w
mul r0.xyz, r0, v5
mov oPos, r2
mul r1.xyz, v2, c17.w
mul oD0.xyz, r0, c27.y
mov oT1.zw, r2
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c24.y
max oD0.w, r1, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c15
dp4 r0.y, r1, c14
dp4 r0.x, r1, c13
mul r1.xyz, r0.w, c16
add r0.xyz, r2, r0
mad oT1.xy, r4.z, c9.zwzw, r4
add oT2.xyz, r0, r1
mad oT0.xy, v3, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmllaffapmnimekdgjdkiilfdmmbkifjcabaaaaaapmakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcfmajaaaa
eaaaabaafhacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaai
bcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaam
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaap
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaaeaaaaaa
abaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaaeaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjemlcgpjckblifbkgimjjdnidnbkkaneabaaaaaapabaaaaaaeaaaaaa
daaaaaaacaagaaaaieapaaaaembaaaaaebgpgodjoiafaaaaoiafaaaaaaacpopp
gmafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaafaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbiaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbjaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbkaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafblaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbmaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafbnaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafboaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoeja
beaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabdaappka
aaaaaaiaaeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaania
aaaaaaiabfaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiabgaaoekaaaaapiia
afaaaaadabaaadiaaaaaoiiabdaaffkaafaaaaadacaaapiaabaaffiabjaajeka
aeaaaaaeabaaapiaabaaaaiablaaoekaacaaoeiaabaaaaacacaaabiabdaaaaka
aeaaaaaeabaaapiaacaaaaiabhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeia
aeaaaaaeabaaapiaabaaoeiabiaaaakabiaaffkaafaaaaadacaaapiaabaaoeia
abaaoeiaafaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeia
bjaappkaabaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapia
acaaoeiaadaaoeiaaeaaaaaeabaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaae
abaaapiaacaaoeiabiaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffja
ajaaaaadaaaaaiiaabaaoeiabkaajakaafaaaaadaaaaaiiaaaaappiabkaappka
ajaaaaadabaaabiaacaaoeiabmaaoekaajaaaaadabaaaeiaacaaoeiabnaaoeka
aeaaaaaeaaaaafiaabaaoeiabdaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffia
alaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapia
amaaoekaaaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiabeaaoekbaiaaaaad
aaaaabiaaaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibbdaappkaafaaaaad
aaaaabiaaaaaaaiabeaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaad
aaaaabiaaaaaaaiaboaakkkaakaaaaadabaaaioaaaaaaaiaboaappkaaeaaaaae
abaaapiaanaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaboaaaakaacaaaaad
aaaaahiaaaaaaaiabcaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaboaaffka
acaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoeja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaabaapeia
boaaffkaafaaaaadaaaaaiiaaaaaffiaacaaaakaacaaaaadacaaadoaaaaakkia
aaaaomiaafaaaaadaaaaahiaacaaoejabbaappkaafaaaaadacaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
baaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiaboaappkaajaaaaadacaaabia
adaaoekaaaaaoeiaajaaaaadacaaaciaaeaaoekaaaaaoeiaajaaaaadacaaaeia
afaaoekaaaaaoeiaafaaaaadadaaapiaaaaacjiaaaaakeiaajaaaaadaeaaabia
agaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaadaeaaaeia
aiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaacia
aaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaae
adaaahoaajaaoekaaaaaaaiaacaaoeiaaeaaaaaeaaaaadmaabaappiaaaaaoeka
abaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeiappppaaaa
fdeieefcfmajaaaaeaaaabaafhacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaa
aeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaa
aaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaa
abaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaan
pcaabaaaabaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaa
kgikcaaaaeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaa
acaaaaaapgipcaaaaeaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..21],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.xyz, vertex.position, -c[17];
DP3 R0.x, R0, R0;
SLT R0.x, c[16].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[18], vertex.position;
MAD R3.xyz, R0.y, c[19], R1;
MUL R0.x, R3.z, c[16].y;
MUL R1.xyz, R0.x, c[23];
MUL R0.x, R3, c[16].y;
MAD R1, R0.x, c[22], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[23].w;
ADD R1, R0, -c[24].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[24].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[24].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[24].y, R1;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R0.x, R0, c[27].xxyz;
MOV R0.w, c[28].x;
DP4 R2.x, R1, c[26];
DP4 R2.y, R1, c[25];
MAD R1.xz, -R2.xyyw, c[16].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
ADD R3.xyz, R1, -c[17];
DP3 R3.x, R3, R3;
DP4 R2.w, R1, c[8];
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MUL R4.xyz, R2.xyww, c[27].w;
MOV result.position, R2;
MOV result.texcoord[1].zw, R2;
MUL R4.y, R4, c[13].x;
ADD R3.x, -R3, c[16].w;
MUL R2.x, R3, c[17].w;
MUL R2.w, R2.x, c[0].y;
MIN R2.w, R2, c[28].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
DP4 R1.w, R1, c[3];
ADD R2.xyz, R2, -c[14];
MOV R1.x, c[27].w;
ADD R1.xyz, -R1.x, c[15];
MAD R0.xyz, R0.x, R1, c[27].w;
ADD R0.w, R0, -c[14];
MUL R0.xyz, R0, vertex.color;
ADD result.texcoord[1].xy, R4, R4.z;
MUL result.texcoord[3].xyz, R2, c[14].w;
MAX result.color.w, R2, c[28].y;
MUL result.texcoord[3].w, -R1, R0;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[20], c[20].zwzw;
END
# 63 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_CameraRight]
Vector 19 [_CameraUp]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00000000, 0.00600000, 0.02000000, 0.05000000
def c23, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c24, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c25, 6.40884876, -3.14159274, -0.16161616, 0.00833330
def c26, -0.00019841, 0.47193992, 0.18877596, 0.09438798
def c27, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c28, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c29, -0.50000000, 0.50000000, 1.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c17
dp3 r0.x, r0, r0
slt r0.x, c16.w, r0
max r0.x, -r0, r0
slt r0.x, c22, r0
add r0.x, -r0, c29.z
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c18, v0
mad r3.xyz, r0.y, c19, r1
mul r0.x, r3.z, c16.y
mul r1.xyz, r0.x, c22.yzww
mul r0.x, r3, c16.y
mad r1, r0.x, c23, r1.xyyz
mov r0.x, c16
mad r0, c24, r0.x, r1
frc r0, r0
mad r1, r0, c25.x, c25.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c25.z, r1
mul r2, r2, r0
mad r1, r2, c25.w, r1
mul r0, r2, r0
mad r0, r0, c26.x, r1
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r0.x, r0, c26.yyzw
mov r0.w, c14
dp4 r2.x, r1, c28
dp4 r2.y, r1, c27
mad r1.xz, -r2.xyyw, c16.z, r3
mov r1.y, r3
mov r1.w, v0
add r3.xyz, r1, -c17
dp3 r3.x, r3, r3
dp4 r2.w, r1, c7
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
mul r4.xyz, r2.xyww, c29.y
mov oPos, r2
mov oT1.zw, r2
mul r4.y, r4, c12.x
add r3.x, -r3, c16.w
mul r2.x, r3, c17.w
mul r2.w, r2.x, c24.y
min r2.w, r2, c29.z
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
dp4 r1.w, r1, c2
add r2.xyz, r2, -c14
mov r1.xyz, c15
add r1.xyz, c29.x, r1
mad r0.xyz, r0.x, r1, c29.y
add r0.w, c29.z, -r0
mul r0.xyz, r0, v5
mad oT1.xy, r4.z, c13.zwzw, r4
mul oT3.xyz, r2, c14.w
max oD0.w, r2, c22.x
mul oT3.w, -r1, r0
mul oD0.xyz, r0, c24.y
mad oT0.xy, v3, c21, c21.zwzw
mad oT2.xy, v4, c20, c20.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedniobllcgcgiclbebnflknccfbigfdoibabaaaaaapmakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefceeajaaaaeaaaabaafbacaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaa
fjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacaeaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaaeaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
aeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaa
egiccaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaa
dcaaaaamhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaacaaaaaa
egbcbaaaafaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaaeaaaaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
dkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaaeaaaaaa
acaaaaaapgapbaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaaabaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
abaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
agajbaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaagaobaaaaaaaaaaaaaaaaaajncaabaaaaaaaaaaaagaobaaa
aaaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaa
igadbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaaaaaaaaajbcaabaaaaaaaaaaa
dkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaa
aeaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedneikncbaahobjfelmfcikiiedpeakldkabaaaaaamebaaaaaaeaaaaaa
daaaaaaapeafaaaaeaapaaaaaibaaaaaebgpgodjlmafaaaalmafaaaaaaacpopp
emafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaeaaaaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafbhaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
biaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbjaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbkaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafblaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
bmaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbnaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejabdaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaamaaaaadaaaaabiabcaappkaaaaaaaiaaeaaaaaeaaaaadia
aaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiabeaajekaaaaajeja
aeaaaaaeaaaaahiaaaaaffiabfaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiia
bcaaffkaafaaaaadacaaapiaabaaffiabgaajekaaeaaaaaeabaaapiaabaaaaia
bkaaoekaacaaoeiaabaaaaacacaaabiabcaaaakaaeaaaaaeabaaapiaacaaaaia
bhaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeia
biaaaakabiaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapia
abaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiabgaappkaabaaoeiaafaaaaad
adaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaae
abaaapiaadaaoeiabiaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiabiaappka
abaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeia
abaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeia
bjaajakaafaaaaadaaaaaiiaaaaappiabjaappkaajaaaaadabaaabiaacaaoeia
blaaoekaajaaaaadabaaaeiaacaaoeiabmaaoekaaeaaaaaeaaaaafiaabaaoeia
bcaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeiabdaaoekbaiaaaaadabaaabia
abaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaibbcaappkaafaaaaadabaaabia
abaaaaiabdaappkaacaaaaadabaaabiaabaaaaiaabaaaaiaalaaaaadabaaabia
abaaaaiabnaakkkaakaaaaadabaaaioaabaaaaiabnaappkaabaaaaacabaaajia
bnaaoekaacaaaaadabaaahiaabaaaaiabbaaoekaaeaaaaaeabaaahiaaaaappia
abaaoeiabnaaffkaacaaaaadabaaahiaabaaoeiaabaaoeiaafaaaaadabaaahoa
abaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaafaaaaad
acaaapiaaaaaffiaagaaoekaaeaaaaaeacaaapiaafaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaahaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaaiaaoeka
aaaappjaacaaoeiaafaaaaadadaaahiaacaapeiabnaaffkaafaaaaadadaaaiia
adaaffiaadaaaakaacaaaaadacaaadoaadaakkiaadaaomiaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffiaaoaaoekaafaaaaad
aaaaaciaaaaaffiaakaakkkaaeaaaaaeaaaaaciaajaakkkaaaaaaaiaaaaaffia
aeaaaaaeaaaaaciaalaakkkaaaaakkiaaaaaffiaaeaaaaaeaaaaaciaamaakkka
aaaappjaaaaaffiaaeaaaaaeabaaahiaanaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaaniaapaajekaaaaakkiaabaajeiaaeaaaaaeaaaaaniabaaajekaaaaappja
aaaaoeiaacaaaaadaaaaaniaaaaaoeiaaeaajekbafaaaaadadaaahoaaaaapiia
aeaappkaacaaaaadaaaaabiaabaappiaaeaappkbafaaaaadadaaaioaaaaaaaia
aaaaffibaeaaaaaeaaaaadmaacaappiaaaaaoekaacaaoeiaabaaaaacaaaaamma
acaaoeiaabaaaaacacaaamoaacaaoeiappppaaaafdeieefceeajaaaaeaaaabaa
fbacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaa
baaaaaaafjaaaaaeegiocaaaaeaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaa
aeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaakaabaaa
aaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagijcaaaaeaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaaeaaaaaaaeaaaaaaigadbaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaaeaaaaaa
abaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaan
pcaabaaaabaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaa
kgikcaaaaeaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaa
acaaaaaaegiccaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaaaadcaaaaamhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaa
acaaaaaaegbcbaaaafaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
aeaaaaaaacaaaaaapgapbaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaa
abaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaa
acaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaagajbaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagijcaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaagaobaaaaaaaaaaaaaaaaaajncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaa
aeaaaaaaigadbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaaaaaaaaajbcaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Vector 5 [_ProjectionParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_CameraRight]
Vector 10 [_CameraUp]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[20] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..12],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[8];
DP3 R0.x, R0, R0;
SLT R0.x, c[7].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[9], vertex.position;
MAD R3.xyz, R0.y, c[10], R1;
MUL R0.x, R3.z, c[7].y;
MUL R1.xyz, R0.x, c[14];
MUL R0.x, R3, c[7].y;
MAD R1, R0.x, c[13], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[14].w;
ADD R0, R0, -c[15].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[15].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[15].z, R0;
MAD R0, R1, c[15].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[17];
DP4 R2.y, R1, c[16];
MAD R1.xz, -R2.xyyw, c[7].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.w, R1, c[4];
DP4 R2.z, R1, c[3];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[18].w;
MUL R3.y, R3, c[5].x;
ADD result.texcoord[1].xy, R3, R3.z;
ADD R3.xyz, R1, -c[8];
DP3 R1.x, R3, R3;
ADD R1.x, -R1, c[7].w;
MUL R1.y, R1.x, c[8].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[18].xxyz;
MOV R1.x, c[18].w;
ADD R1.xyz, -R1.x, c[6];
MAD R0.xyz, R0.x, R1, c[18].w;
MIN R0.w, R1, c[19].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position, R2;
MOV result.texcoord[1].zw, R2;
MAX result.color.w, R0, c[19].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[11], c[11].zwzw;
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_CameraRight]
Vector 10 [_CameraUp]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c14, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c15, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c16, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c17, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c18, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c19, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c20, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.xyz, v0, -c8
dp3 r0.x, r0, r0
slt r0.x, c7.w, r0
max r0.x, -r0, r0
slt r0.x, c13, r0
add r0.x, -r0, c13.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c9, v0
mad r3.xyz, r0.y, c10, r1
mul r0.x, r3.z, c7.y
mul r1.xyz, r0.x, c14
mul r0.x, r3, c7.y
mad r0, r0.x, c15, r1.xyyz
mov r1.x, c7
mad r0, c16, r1.x, r0
frc r0, r0
mad r0, r0, c13.z, c13.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c14.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c17.x, r0
mad r0, r1, c17.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c19
dp4 r2.y, r1, c18
mad r1.xz, -r2.xyyw, c7.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.w, r1, c3
dp4 r2.z, r1, c2
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r3.xyz, r2.xyww, c17.w
mul r3.y, r3, c4.x
mad oT1.xy, r3.z, c5.zwzw, r3
add r3.xyz, r1, -c8
dp3 r1.x, r3, r3
add r1.x, -r1, c7.w
mul r1.w, r1.x, c8
mov r1.xyz, c6
dp4 r0.x, r0, c20.xxyz
mul r1.w, r1, c16.y
add r1.xyz, c17.z, r1
mad r0.xyz, r0.x, r1, c17.w
min r0.w, r1, c13.y
mul r0.xyz, r0, v5
mov oPos, r2
mov oT1.zw, r2
max oD0.w, r0, c13.x
mul oD0.xyz, r0, c16.y
mad oT0.xy, v3, c12, c12.zwzw
mad oT2.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecednmmflnldigcniegdjfkmpkfcloommnjeabaaaaaabaajaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchaahaaaa
eaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadhcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
apcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaa
afaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefieceddoeabhmgkcjedphnmnknmgmbcahnefamabaaaaaaoianaaaaaeaaaaaa
daaaaaaaaeafaaaahmamaaaaeeanaaaaebgpgodjmmaeaaaammaeaaaaaaacpopp
heaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaafaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaalp
aaaaaadpaaaaaaaaaaaaiadpfbaaaaafaoaaapkakgjlmedlaknhkddmmnmmemdn
lfhocflofbaaaaafapaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaaf
baaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbbaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbcaaapkakgjleedmaknhkddmipmchfdn
kgjlmedmfbaaaaafbdaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaaf
beaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaakaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaajaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
alaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaamaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiaajaaffkaafaaaaadacaaapiaabaaffiaaoaajekaaeaaaaae
abaaapiaabaaaaiabcaaoekaacaaoeiaabaaaaacacaaabiaajaaaakaaeaaaaae
abaaapiaacaaaaiaapaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiabaaaaakabaaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiaaoaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiabaaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiabaaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiabbaajakaafaaaaadaaaaaiiaaaaappiabbaappkaajaaaaad
abaaabiaacaaoeiabdaaoekaajaaaaadabaaaeiaacaaoeiabeaaoekaaeaaaaae
aaaaafiaabaaoeiaajaakkkbaaaaoeiaafaaaaadabaaapiaaaaaffiaafaaoeka
aeaaaaaeabaaapiaaeaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaagaaoeka
aaaakkiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaakaaoekbaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaacaaaaadaaaaabiaaaaaaaibajaappkaafaaaaadaaaaabia
aaaaaaiaakaappkaacaaaaadaaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabia
aaaaaaiaanaakkkaakaaaaadabaaaioaaaaaaaiaanaappkaaeaaaaaeabaaapia
ahaaoekaaaaappjaabaaoeiaabaaaaacaaaaabiaanaaaakaacaaaaadaaaaahia
aaaaaaiaaiaaoekaaeaaaaaeaaaaahiaaaaappiaaaaaoeiaanaaffkaacaaaaad
aaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaahiaabaapeiaanaaffka
afaaaaadaaaaaiiaaaaaffiaadaaaakaacaaaaadacaaadoaaaaakkiaaaaaomia
aeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadmaabaappia
aaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaacacaaamoaabaaoeia
ppppaaaafdeieefchaahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
afaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[1] = { program.local[0] };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, R0, fragment.color.primary;
SLT R0.w, R1, c[0].x;
MUL result.color.w, R1, fragment.color.primary;
TXP R0.xyz, fragment.texcoord[1], texture[1], 2D;
KIL -R0.w;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
ADD R0.xyz, -R0, fragment.texcoord[2];
MUL result.color.xyz, R1, R0;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xyz
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r2, -r0.x
texldp r0, t1, s1
texkill r2.xyzw
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, t2
mul_pp r0.xyz, r1, r0
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfoeajjgagfkbabaffedbnogdbififeadabaaaaaaoeacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcniabaaaaeaaaaaaahgaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafhcaabaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
egbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcpkepeaackkgmjfengkekhimkphfmolmabaaaaaaeaaeaaaaaeaaaaaa
daaaaaaaiiabaaaagiadaaaaamaeaaaaebgpgodjfaabaaaafaabaaaaaaacpppp
biabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
adaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaacaapplaafaaaaad
acaaadiaacaappiaacaaoelaebaaaaababaaapiaecaaaaadabaacpiaacaaoeia
abaioekaapaaaaacacaacbiaabaaaaiaapaaaaacacaacciaabaaffiaapaaaaac
acaaceiaabaakkiaacaaaaadabaachiaacaaoeibadaaoelaafaaaaadabaachia
aaaaoeiaabaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefcniabaaaaeaaaaaaahgaaaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafhcaabaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaegbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[2], 2D;
TXP R3.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R2, R0, fragment.color.primary;
SLT R0.x, R2.w, c[0];
MUL R1.xyz, R1.w, R1;
DP4 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL result.color.w, R2, fragment.color.primary;
KIL -R0.x;
TEX R0, fragment.texcoord[2], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].x;
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[2].x, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R0.xyz, R0.w, R1, R0;
LG2 R1.x, R3.x;
LG2 R1.y, R3.y;
LG2 R1.z, R3.z;
ADD R0.xyz, -R1, R0;
MUL result.color.xyz, R2, R0;
END
# 22 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xy
dcl t3
texld r0, t0, s0
texldp r2, t1, s1
texld r3, t2, s2
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul_pp r3.xyz, r3.w, r3
log_pp r2.x, r2.x
log_pp r2.y, r2.y
log_pp r2.z, r2.z
texkill r0.xyzw
texld r0, t2, s3
mul_pp r4.xyz, r0.w, r0
mul_pp r4.xyz, r4, c2.z
dp4 r0.x, t3, t3
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r3.xyz, r3, c2.z, -r4
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r3, r4
add_pp r0.xyz, -r2, r0
mul_pp r0.xyz, r1, r0
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaobggjfibgjaebbmnipdmhammdkpobddabaaaaaaieaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
gaadaaaaeaaaaaaaniaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaabbaaaaahbcaabaaaabaaaaaaegbobaaa
aeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
dccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaaaaaaaaaaahaaaaaa
dkiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahccaabaaaabaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaabaaaaaaagajbaaaacaaaaaa
fgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdcaaaaakhcaabaaaacaaaaaapgapbaaaacaaaaaaegacbaaa
acaaaaaajgahbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaaaoaaaaahdcaabaaaacaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafhcaabaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedneejlgefdiiiopjnenbikibjffalplogabaaaaaaoeagaaaaaeaaaaaa
daaaaaaaimacaaaapeafaaaalaagaaaaebgpgodjfeacaaaafeacaaaaaaacpppp
aiacaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaaeaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaappla
aaaaaakbafaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacacaaadiaaaaablla
agaaaaacacaaaeiaacaapplaafaaaaadadaaadiaacaakkiaacaaoelaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaadaioekaecaaaaadacaacpiaacaaoeia
acaioekaecaaaaadadaacpiaadaaoeiaabaioekaajaaaaadadaaaiiaadaaoela
adaaoelaahaaaaacadaaaiiaadaappiaagaaaaacadaaaiiaadaappiaaeaaaaae
adaadiiaadaappiaabaakkkaabaappkaafaaaaadabaaciiaabaappiaacaaaaka
afaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaaciiaacaappiaacaaaaka
aeaaaaaeacaachiaabaappiaacaaoeiaabaaoeibaeaaaaaeabaachiaadaappia
acaaoeiaabaaoeiaapaaaaacacaacbiaadaaaaiaapaaaaacacaacciaadaaffia
apaaaaacacaaceiaadaakkiaacaaaaadabaachiaabaaoeiaacaaoeibafaaaaad
abaachiaaaaaoeiaabaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefcgaadaaaaeaaaaaaaniaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaa
aaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
bbaaaaahbcaabaaaabaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadccaaaalbcaabaaaabaaaaaaakaabaaa
abaaaaaackiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahccaabaaaabaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaah
ocaabaaaabaaaaaaagajbaaaacaaaaaafgafbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
icaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaa
acaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaajgahbaiaebaaaaaaabaaaaaa
dcaaaaajhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaacpaaaaafhcaabaaaacaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, R0, fragment.color.primary;
SLT R0.x, R1.w, c[0];
LG2 R2.x, R2.x;
LG2 R2.z, R2.z;
LG2 R2.y, R2.y;
MUL result.color.w, R1, fragment.color.primary;
KIL -R0.x;
TEX R0, fragment.texcoord[2], texture[2], 2D;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[1].x, -R2;
MUL result.color.xyz, R1, R0;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xy
texld r0, t0, s0
texldp r1, t1, s1
mul r2, r0, v0
add_pp r0.x, r2.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
texkill r0.xyzw
texld r0, t2, s2
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c1.z, -r1
mul_pp r0.xyz, r2, r0
mul_pp r0.w, r2, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefieceddagaelibfepenanljcjkgjpkjckfekibabaaaaaaeiadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcdmacaaaaeaaaaaaaipaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaacaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedebillmokjkgmkdncifdoaaimhebinmnoabaaaaaapaaeaaaaaeaaaaaa
daaaaaaaneabaaaabiaeaaaalmaeaaaaebgpgodjjmabaaaajmabaaaaaaacpppp
gaabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakbafaaaaad
aaaacpiaaaaaoeiaabaaoelaabaaaaacacaaadiaaaaabllaagaaaaacacaaaeia
acaapplaafaaaaadadaaadiaacaakkiaacaaoelaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaacaioekaecaaaaadacaacpiaadaaoeiaabaioekaafaaaaad
abaaciiaabaappiaabaaaakaapaaaaacadaacbiaacaaaaiaapaaaaacadaaccia
acaaffiaapaaaaacadaaceiaacaakkiaaeaaaaaeabaachiaabaappiaabaaoeia
adaaoeibafaaaaadabaachiaaaaaoeiaabaaoeiaafaaaaadabaaciiaaaaappia
abaapplaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefcdmacaaaaeaaaaaaa
ipaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaa
aaaaaaaadkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
cpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaabejfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[1] = { program.local[0] };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, R0, fragment.color.primary;
SLT R0.w, R1, c[0].x;
MUL result.color.w, R1, fragment.color.primary;
TXP R0.xyz, fragment.texcoord[1], texture[1], 2D;
KIL -R0.w;
ADD R0.xyz, R0, fragment.texcoord[2];
MUL result.color.xyz, R1, R0;
END
# 8 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xyz
texld r0, t0, s0
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r2, -r0.x
texldp r0, t1, s1
texkill r2.xyzw
add_pp r0.xyz, r0, t2
mul_pp r0.xyz, r1, r0
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfbkjflgpmolnhlhppcldffeobidddenbabaaaaaammacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 112
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddglonafcjmmablinficenimohfhedjhgabaaaaaaaeaeaaaaaeaaaaaa
daaaaaaageabaaaacmadaaaanaadaaaaebgpgodjcmabaaaacmabaaaaaaacpppp
peaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
adaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaacaapplaafaaaaad
acaaadiaacaappiaacaaoelaebaaaaababaaapiaecaaaaadabaacpiaacaaoeia
abaioekaacaaaaadabaachiaabaaoeiaadaaoelaafaaaaadabaachiaaaaaoeia
abaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaacaaaicpiaabaaoeia
ppppaaaafdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaa
akiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[2], 2D;
TXP R3.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R2, R0, fragment.color.primary;
SLT R0.x, R2.w, c[0];
MUL R1.xyz, R1.w, R1;
DP4 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL result.color.w, R2, fragment.color.primary;
KIL -R0.x;
TEX R0, fragment.texcoord[2], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].x;
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[2].x, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R0.xyz, R0.w, R1, R0;
ADD R0.xyz, R3, R0;
MUL result.color.xyz, R2, R0;
END
# 19 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xy
dcl t3
texld r0, t0, s0
texldp r2, t1, s1
texld r3, t2, s3
mul r1, r0, v0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul_pp r3.xyz, r3.w, r3
mul_pp r3.xyz, r3, c2.z
texkill r0.xyzw
texld r0, t2, s2
mul_pp r4.xyz, r0.w, r0
dp4 r0.x, t3, t3
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r4.xyz, r4, c2.z, -r3
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r4, r3
add_pp r0.xyz, r2, r0
mul_pp r0.xyz, r1, r0
mul_pp r0.w, r1, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecednoenbdcknadffmhjlmampcgemcbplfjoabaaaaaagmaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
eiadaaaaeaaaaaaancaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaabbaaaaahbcaabaaaabaaaaaaegbobaaa
aeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
dccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaaaaaaaaaaahaaaaaa
dkiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahccaabaaaabaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaabaaaaaaagajbaaaacaaaaaa
fgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdcaaaaakhcaabaaaacaaaaaapgapbaaaacaaaaaaegacbaaa
acaaaaaajgahbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaaaoaaaaahdcaabaaaacaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
Vector 112 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaecaopfabhkcgjpmcofpkhpncofdfefeabaaaaaakiagaaaaaeaaaaaa
daaaaaaagiacaaaaliafaaaaheagaaaaebgpgodjdaacaaaadaacaaaaaaacpppp
oeabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaaeaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaappla
aaaaaakbafaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacacaaadiaaaaablla
agaaaaacacaaaeiaacaapplaafaaaaadadaaadiaacaakkiaacaaoelaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaadaioekaecaaaaadacaacpiaacaaoeia
acaioekaecaaaaadadaacpiaadaaoeiaabaioekaajaaaaadadaaaiiaadaaoela
adaaoelaahaaaaacadaaaiiaadaappiaagaaaaacadaaaiiaadaappiaaeaaaaae
adaadiiaadaappiaabaakkkaabaappkaafaaaaadabaaciiaabaappiaacaaaaka
afaaaaadabaachiaabaaoeiaabaappiaafaaaaadabaaciiaacaappiaacaaaaka
aeaaaaaeacaachiaabaappiaacaaoeiaabaaoeibaeaaaaaeabaachiaadaappia
acaaoeiaabaaoeiaacaaaaadabaachiaabaaoeiaadaaoeiaafaaaaadabaachia
aaaaoeiaabaaoeiaafaaaaadabaaciiaaaaappiaabaapplaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefceiadaaaaeaaaaaaancaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaabbaaaaah
bcaabaaaabaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaa
ckiacaaaaaaaaaaaahaaaaaadkiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
ccaabaaaabaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaa
abaaaaaaagajbaaaacaaaaaafgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
acaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaacaaaaaa
pgapbaaaacaaaaaaegacbaaaacaaaaaajgahbaiaebaaaaaaabaaaaaadcaaaaaj
hcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaa
aoaaaaahdcaabaaaacaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaabejfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R2.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R1, R0, fragment.color.primary;
SLT R0.x, R1.w, c[0];
MUL result.color.w, R1, fragment.color.primary;
KIL -R0.x;
TEX R0, fragment.texcoord[2], texture[2], 2D;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[1].x, R2;
MUL result.color.xyz, R1, R0;
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0
dcl t1
dcl t2.xy
texld r0, t0, s0
texldp r1, t1, s1
mul r2, r0, v0
add_pp r0.x, r2.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
texld r0, t2, s2
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c1.z, r1
mul_pp r0.xyz, r2, r0
mul_pp r0.w, r2, v0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbboibpbfbichnclpmefdcfnbmcgmcmdbabaaaaaadaadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcceacaaaaeaaaaaaaijaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaajhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaa
aaaaaaaadkbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 144
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfkenhmhegacokglhhdipicacbjjldhmmabaaaaaaleaeaaaaaeaaaaaa
daaaaaaalaabaaaanmadaaaaiaaeaaaaebgpgodjhiabaaaahiabaaaaaaacpppp
dmabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaacplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaaeaaaaaeabaacpiaaaaappiaabaapplaaaaaaakbafaaaaad
aaaacpiaaaaaoeiaabaaoelaagaaaaacacaaaiiaacaapplaafaaaaadacaaadia
acaappiaacaaoelaabaaaaacadaaadiaaaaabllaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaabaioekaecaaaaadacaacpiaadaaoeiaacaioekaafaaaaad
abaaciiaacaappiaabaaaakaaeaaaaaeabaachiaabaappiaacaaoeiaabaaoeia
afaaaaadabaachiaaaaaoeiaabaaoeiaafaaaaadabaaciiaaaaappiaabaappla
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefcceacaaaaeaaaaaaaijaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkbabaaaacaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadbaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
diaaaaahicaabaaaabaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaaj
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaah
iccabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaadoaaaaabejfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Vector 5 [unity_LightShadowBias]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_CameraRight]
Vector 10 [_CameraUp]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[19] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..11],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[8];
DP3 R0.x, R0, R0;
SLT R0.x, c[7].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[9], vertex.position;
MAD R3.xyz, R0.y, c[10], R1;
MUL R0.x, R3.z, c[7].y;
MUL R1.xyz, R0.x, c[13];
MUL R0.x, R3, c[7].y;
MAD R1, R0.x, c[12], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[13].w;
ADD R0, R0, -c[14].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[14].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[14].z, R0;
MAD R0, R1, c[14].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[16];
DP4 R2.y, R1, c[15];
MAD R1.xz, -R2.xyyw, c[7].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.w, R1, c[4];
DP4 R2.x, R1, c[3];
ADD R2.x, R2, c[5];
MAX R2.y, R2.x, -R2.w;
ADD R2.y, R2, -R2.x;
MAD result.position.z, R2.y, c[5].y, R2.x;
ADD R2.xyz, R1, -c[8];
DP3 R2.x, R2, R2;
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R2.x, -R2, c[7].w;
MUL R1.y, R2.x, c[8].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[17].xxyz;
MOV R1.x, c[17].w;
ADD R1.xyz, -R1.x, c[6];
MAD R0.xyz, R0.x, R1, c[17].w;
MIN R0.w, R1, c[18].x;
MUL R0.xyz, R0, vertex.color;
MOV result.position.w, R2;
MAX result.color.w, R0, c[18].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[11], c[11].zwzw;
END
# 53 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Vector 4 [unity_LightShadowBias]
Vector 5 [_WavingTint]
Vector 6 [_WaveAndDistance]
Vector 7 [_CameraPosition]
Vector 8 [_CameraRight]
Vector 9 [_CameraUp]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c12, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c13, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c14, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c15, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c16, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c17, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c18, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c7
dp3 r0.x, r0, r0
slt r0.x, c6.w, r0
max r0.x, -r0, r0
slt r0.x, c11, r0
add r0.x, -r0, c11.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c8, v0
mad r3.xyz, r0.y, c9, r1
mul r0.x, r3.z, c6.y
mul r1.xyz, r0.x, c12
mul r0.x, r3, c6.y
mad r0, r0.x, c13, r1.xyyz
mov r1.x, c6
mad r0, c14, r1.x, r0
frc r0, r0
mad r0, r0, c11.z, c11.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c12.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c15.x, r0
mad r0, r1, c15.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c17
dp4 r2.y, r1, c16
mad r1.xz, -r2.xyyw, c6.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.x, r1, c2
add r2.x, r2, c4
add r3.xyz, r1, -c7
max r2.y, r2.x, c11.x
add r2.y, r2, -r2.x
mad r2.z, r2.y, c4.y, r2.x
dp4 r2.w, r1, c3
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
dp3 r3.x, r3, r3
add r1.x, -r3, c6.w
mul r1.w, r1.x, c7
mov r1.xyz, c5
dp4 r0.x, r0, c18.xxyz
mul r1.w, r1, c14.y
add r1.xyz, c15.z, r1
mad r0.xyz, r0.x, r1, c15.w
min r0.w, r1, c11.y
mul r0.xyz, r0, v5
mov oPos, r2
mov oT0, r2
max oD0.w, r0, c11.x
mul oD0.xyz, r0, c14.y
mad oT1.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedcholonjcihdfplhbpdgfbkhjgajjknmoabaaaaaaiaaiaaaaadaaaaaa
cmaaaaaapeaaaaaagiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaagfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcbaahaaaaeaaaabaameabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
hcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
egbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
adaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
acaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
abaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
abaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
fgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaa
agacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaaadaaaaaa
acaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadgaaaaaflccabaaaaaaaaaaaegambaaaabaaaaaadeaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaa
bkiacaaaabaaaaaaafaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecednffmpcbpbfhmmomdgoaplcaknliajnmiabaaaaaaeaanaaaaaeaaaaaa
daaaaaaaomaeaaaaaeamaaaammamaaaaebgpgodjleaeaaaaleaeaaaaaaacpopp
fmaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
adaaaaaaafaaahaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafamaaapkakgjlmedl
aknhkddmmnmmemdnlfhocflofbaaaaafanaaapkajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeafbaaaaafaoaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaaf
apaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbaaaapkakgjleedm
aknhkddmipmchfdnkgjlmedmfbaaaaafbbaaapkakgjlmedmaknhcddnipmcpfln
kgjlmednfbaaaaafbcaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaaf
bdaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaacaaaaadaaaaahiaaaaaoejaajaaoekbaiaaaaadaaaaabiaaaaaoeia
aaaaoeiaamaaaaadaaaaabiaaiaappkaaaaaaaiaaeaaaaaeaaaaadiaaaaaaaia
abaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaiaakaajekaaaaajejaaeaaaaae
aaaaahiaaaaaffiaalaaoekaaaaapiiaafaaaaadabaaadiaaaaaoiiaaiaaffka
afaaaaadacaaapiaabaaffiaamaajekaaeaaaaaeabaaapiaabaaaaiabaaaoeka
acaaoeiaabaaaaacacaaabiaaiaaaakaaeaaaaaeabaaapiaacaaaaiaanaaoeka
abaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaaeabaaapiaabaaoeiaaoaaaaka
aoaaffkaafaaaaadacaaapiaabaaoeiaabaaoeiaafaaaaadadaaapiaabaaoeia
acaaoeiaaeaaaaaeabaaapiaadaaoeiaamaappkaabaaoeiaafaaaaadadaaapia
acaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeiaadaaoeiaaeaaaaaeabaaapia
adaaoeiaaoaakkkaabaaoeiaaeaaaaaeabaaapiaacaaoeiaaoaappkaabaaoeia
afaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeia
afaaaaadacaaapiaabaaoeiaabaaffjaajaaaaadaaaaaiiaabaaoeiaapaajaka
afaaaaadaaaaaiiaaaaappiaapaappkaajaaaaadabaaabiaacaaoeiabbaaoeka
ajaaaaadabaaaeiaacaaoeiabcaaoekaaeaaaaaeaaaaafiaabaaoeiaaiaakkkb
aaaaoeiaafaaaaadabaaapiaaaaaffiaaeaaoekaaeaaaaaeabaaapiaadaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaafaaoekaaaaakkiaabaaoeiaacaaaaad
aaaaahiaaaaaoeiaajaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaacaaaaad
aaaaabiaaaaaaaibaiaappkaafaaaaadaaaaabiaaaaaaaiaajaappkaacaaaaad
aaaaabiaaaaaaaiaaaaaaaiaalaaaaadaaaaabiaaaaaaaiabdaakkkaakaaaaad
abaaaioaaaaaaaiabdaappkaaeaaaaaeabaaapiaagaaoekaaaaappjaabaaoeia
abaaaaacaaaaabiabdaaaakaacaaaaadaaaaahiaaaaaaaiaahaaoekaaeaaaaae
aaaaahiaaaaappiaaaaaoeiabdaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeia
afaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaacaaaaadaaaaabiaabaakkiaacaaaakaalaaaaadaaaaaciaaaaaaaia
bdaakkkaacaaaaadaaaaaciaaaaaaaibaaaaffiaaeaaaaaeaaaaaemaacaaffka
aaaaffiaaaaaaaiaaeaaaaaeaaaaadmaabaappiaaaaaoekaabaaoeiaabaaaaac
aaaaaimaabaappiappppaaaafdeieefcbaahaaaaeaaaabaameabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacaeaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaai
bcaabaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaam
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaadaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaak
pcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaa
agiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaap
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaa
abaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaaacaaaaaapgipcaaa
adaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaackaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaadgaaaaaflccabaaaaaaaaaaaegambaaaabaaaaaadeaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaiccaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkiacaaaabaaaaaaafaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaagfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_LightPositionRange]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_CameraRight]
Vector 14 [_CameraUp]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..15],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[12];
DP3 R0.x, R0, R0;
SLT R0.x, c[11].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[13], vertex.position;
MAD R3.xyz, R0.y, c[14], R1;
MUL R0.x, R3.z, c[11].y;
MUL R1.xyz, R0.x, c[17];
MUL R0.x, R3, c[11].y;
MAD R1, R0.x, c[16], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[17].w;
ADD R0, R0, -c[18].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[18].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[18].z, R0;
MAD R0, R1, c[18].y, R0;
MUL R0, R0, R0;
MUL R0, R0, R0;
MUL R1, R0, vertex.attrib[14].y;
DP4 R2.x, R1, c[20];
DP4 R2.y, R1, c[19];
MAD R1.xz, -R2.xyyw, c[11].z, R3;
MOV R1.y, R3;
MOV R1.w, vertex.position;
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
ADD result.texcoord[0].xyz, R2, -c[9];
ADD R2.xyz, R1, -c[12];
DP3 R2.x, R2, R2;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R2.x, -R2, c[11].w;
MUL R1.y, R2.x, c[12].w;
MUL R1.w, R1.y, c[0].y;
DP4 R0.x, R0, c[21].xxyz;
MOV R1.x, c[21].w;
ADD R1.xyz, -R1.x, c[10];
MAD R0.xyz, R0.x, R1, c[21].w;
MIN R0.w, R1, c[22].x;
MUL R0.xyz, R0, vertex.color;
MAX result.color.w, R0, c[22].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[15], c[15].zwzw;
END
# 52 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_LightPositionRange]
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_CameraRight]
Vector 13 [_CameraUp]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c16, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c17, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c18, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c19, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c20, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c21, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c22, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c11
dp3 r0.x, r0, r0
slt r0.x, c10.w, r0
max r0.x, -r0, r0
slt r0.x, c15, r0
add r0.x, -r0, c15.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c12, v0
mad r3.xyz, r0.y, c13, r1
mul r0.x, r3.z, c10.y
mul r1.xyz, r0.x, c16
mul r0.x, r3, c10.y
mad r0, r0.x, c17, r1.xyyz
mov r1.x, c10
mad r0, c18, r1.x, r0
frc r0, r0
mad r0, r0, c15.z, c15.w
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c16.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c19.x, r0
mad r0, r1, c19.y, r0
mul r0, r0, r0
mul r0, r0, r0
mul r1, r0, v1.y
dp4 r2.x, r1, c21
dp4 r2.y, r1, c20
mad r1.xz, -r2.xyyw, c10.z, r3
mov r1.y, r3
mov r1.w, v0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
add oT0.xyz, r2, -c8
add r2.xyz, r1, -c11
dp3 r2.x, r2, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
add r2.x, -r2, c10.w
mul r1.w, r2.x, c11
mov r1.xyz, c9
dp4 r0.x, r0, c22.xxyz
mul r1.w, r1, c18.y
add r1.xyz, c19.z, r1
mad r0.xyz, r0.x, r1, c19.w
min r0.w, r1, c15.y
mul r0.xyz, r0, v5
max oD0.w, r0, c15.x
mul oD0.xyz, r0, c18.y
mad oT1.xy, v3, c14, c14.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedeiemjnmkbeppimhbidllkjloakooceejabaaaaaamiaiaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefceaahaaaaeaaaabaanaabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaai
bcaabaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaadhaaaaam
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaadaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaak
pcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaaabaaaaaa
agiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaadcaaaaap
pcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaaegaobaaa
acaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaaadaaaaaa
abaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaapcaaaaiiccabaaaadaaaaaapgipcaaaadaaaaaaacaaaaaa
fgafbaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaa
abaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaam
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedbddahnmcmedgfgndopocbkdlhdldngfpabaaaaaakmanaaaaaeaaaaaa
daaaaaaabaafaaaafiamaaaacaanaaaaebgpgodjniaeaaaaniaeaaaaaaacpopp
heaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaabaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaadaaaaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbbaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbcaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbdaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafbeaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbfaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbgaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbhaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejaanaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaamaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
aoaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaapaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiaamaaffkaafaaaaadacaaapiaabaaffiabaaajekaaeaaaaae
abaaapiaabaaaaiabeaaoekaacaaoeiaabaaaaacacaaabiaamaaaakaaeaaaaae
abaaapiaacaaaaiabbaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiabcaaaakabcaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiabaaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiabcaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiabcaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiabdaajakaafaaaaadaaaaaiiaaaaappiabdaappkaajaaaaad
abaaabiaacaaoeiabfaaoekaajaaaaadabaaaeiaacaaoeiabgaaoekaaeaaaaae
aaaaafiaabaaoeiaamaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeiaanaaoekb
aiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaibamaappka
afaaaaadabaaabiaabaaaaiaanaappkaacaaaaadabaaabiaabaaaaiaabaaaaia
alaaaaadabaaabiaabaaaaiabhaakkkaakaaaaadacaaaioaabaaaaiabhaappka
abaaaaacabaaabiabhaaaakaacaaaaadabaaahiaabaaaaiaalaaoekaaeaaaaae
abaaahiaaaaappiaabaaoeiabhaaffkaacaaaaadabaaahiaabaaoeiaabaaoeia
afaaaaadacaaahoaabaaoeiaafaaoejaaeaaaaaeabaaadoaadaaoejaabaaoeka
abaaookaafaaaaadabaaahiaaaaaffiaaiaaoekaafaaaaadacaaapiaaaaaffia
aeaaoekaaeaaaaaeacaaapiaadaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaapia
afaaoekaaaaakkiaacaaoeiaaeaaaaaeacaaapiaagaaoekaaaaappjaacaaoeia
aeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaajaaoeka
aaaakkiaaaaapeiaaeaaaaaeaaaaahiaakaaoekaaaaappjaaaaaoeiaacaaaaad
aaaaahoaaaaaoeiaacaaoekbaeaaaaaeaaaaadmaacaappiaaaaaoekaacaaoeia
abaaaaacaaaaammaacaaoeiappppaaaafdeieefceaahaaaaeaaaabaanaabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaa
fjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadhccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaaaaaaaaajhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaa
adaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaabaaaaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
aaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaa
adaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapahaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaahnaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0 } };
TEMP R0;
TEX R0.w, fragment.texcoord[1], texture[0], 2D;
MUL R0.x, R0.w, fragment.color.primary.w;
SLT R0.x, R0, c[0];
MOV result.color, c[1].x;
KIL -R0.x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 1.00000000, 0, 0
dcl t0.xyzw
dcl t1.xy
dcl v0.xyzw
texld r0, t1, s0
mul r0.w, r0, v0
add_pp r0.x, r0.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
rcp r0.x, t0.w
mul r0.x, t0.z, r0
mov_pp r0, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgkbnabekaddjmbmkncccjamfnnafdechabaaaaaaniabaaaaadaaaaaa
cmaaaaaakaaaaaaaneaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaagfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpmaaaaaaeaaaaaaa
dpaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkglnenlkejpfjhjcdpfldmploclbegfjabaaaaaakaacaaaaaeaaaaaa
daaaaaaapeaaaaaapiabaaaagmacaaaaebgpgodjlmaaaaaalmaaaaaaaaacpppp
iiaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaaeaaaaae
aaaacpiaaaaappiaabaapplaaaaaaakbebaaaaabaaaaapiaabaaaaacaaaacpia
abaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpmaaaaaaeaaaaaaa
dpaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaacaaaaaaakiacaia
ebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheogmaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaagfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..1],
		{ 1, 255, 65025, 16581375 },
		{ 0.99900001, 0.0039215689 } };
TEMP R0;
TEX R0.w, fragment.texcoord[1], texture[0], 2D;
MUL R0.x, R0.w, fragment.color.primary.w;
SLT R0.x, R0, c[1];
KIL -R0.x;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R0.x;
RCP R0.x, R0.x;
MUL R0.x, R0, c[0].w;
MIN R0.x, R0, c[3];
MUL R0, R0.x, c[2];
FRC R0, R0;
MAD result.color, -R0.yzww, c[3].y, R0;
END
# 12 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 0.00000000, 1.00000000, 0.99900001, 0.00392157
def c3, 1.00000000, 255.00000000, 65025.00000000, 16581375.00000000
dcl t0.xyz
dcl t1.xy
dcl v0.xyzw
texld r0, t1, s0
mul r0.w, r0, v0
add_pp r0.x, r0.w, -c1
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
texkill r0.xyzw
dp3 r0.x, t0, t0
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r0.x, r0, c0.w
min r0.x, r0, c2.z
mul r0, r0.x, c3
frc r1, r0
mov r0.z, -r1.w
mov r0.xyw, -r1.yzxw
mad r0, r0, c2.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedhpdigfjmnihmfacenagpfkllbopgnkppabaaaaaamiacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcneabaaaaeaaaaaaahfaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadicbabaaaadaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaadaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaa
dbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaa
abaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaabaaaaaaabaaaaaaddaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaahhlohpdpdiaaaaakpcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaabhoehppachnelbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaanpccabaaaaaaaaaaajgapbaia
ebaaaaaaaaaaaaaaaceaaaaaibiaiadlibiaiadlibiaiadlibiaiadlegaobaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedkljjdiamfedeomcgfccmknijlkogpkkiabaaaaaahmaeaaaaaeaaaaaa
daaaaaaaoaabaaaalmadaaaaeiaeaaaaebgpgodjkiabaaaakiabaaaaaaacpppp
giabaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaaeaaabaaaaaaaaaaaaaaabaaabaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaibiaiadlaaaaaaaaaaaaaaaaaaaaaaaafbaaaaafadaaapkahhlohplp
aaljdolpaaaahklpaaaaaaiafbaaaaafaeaaapkaaaaaiadpaaaahpedaaabhoeh
ppachnelbpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaaiaacaacplabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaabaaoela
aaaioekaaeaaaaaeaaaacpiaaaaappiaacaapplaaaaaaakbebaaaaabaaaaapia
aiaaaaadaaaaabiaaaaaoelaaaaaoelaahaaaaacaaaaabiaaaaaaaiaagaaaaac
aaaaabiaaaaaaaiaafaaaaadaaaaaciaaaaaaaiaabaappkaabaaaaacabaaaiia
adaaaakaaeaaaaaeaaaaabiaaaaaaaiaabaappkaabaappiaafaaaaadabaaapia
aaaaffiaaeaaoekabdaaaaacabaaapiaabaaoeiafiaaaaaeaaaaapiaaaaaaaia
adaaoekbabaaoeiaaeaaaaaeabaacliaaaaamjiaacaaaakbaaaaoeiaaeaaaaae
abaaceiaaaaappiaacaaaakbaaaakkiaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcneabaaaaeaaaaaaahfaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaa
acaaaaaagcbaaaadicbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaa
adaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkiacaaaabaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaahhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaaaceaaaaa
ibiaiadlibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaabejfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCOLLECTOR"
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_CameraRight]
Vector 33 [_CameraUp]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[42] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..34],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[31];
DP3 R0.x, R0, R0;
SLT R0.x, c[30].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[32], vertex.position;
MAD R0.xyz, R0.y, c[33], R1;
MUL R0.w, R0.z, c[30].y;
MUL R1.xyz, R0.w, c[36];
MUL R0.w, R0.x, c[30].y;
MAD R2, R0.w, c[35], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[30].x, R2;
FRC R1, R1;
MUL R1, R1, c[36].w;
ADD R1, R1, -c[37].x;
MUL R2, R1, R1;
MUL R3, R2, R1;
MAD R1, R3, c[37].w, R1;
MUL R3, R3, R2;
MUL R2, R3, R2;
MAD R1, R3, c[37].z, R1;
MAD R1, R2, c[37].y, R1;
MUL R1, R1, R1;
MUL R3, R1, R1;
MUL R1, R3, vertex.attrib[14].y;
MOV R2.w, vertex.position;
DP4 R2.y, R1, c[38];
DP4 R2.x, R1, c[39];
MAD R2.xz, -R2.xyyw, c[30].z, R0;
MOV R2.y, R0;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
MOV result.texcoord[4], R0;
ADD R0.xyz, R2, -c[31];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[30].w;
MUL R0.y, R0.x, c[31].w;
DP4 R0.w, R3, c[40].xxyz;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MUL R1.x, R0.y, c[0].y;
MOV R0.x, c[40].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[40].w;
MIN R0.w, R1.x, c[41].x;
MUL R0.xyz, R0, vertex.color;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[41].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 68 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_WavingTint]
Vector 29 [_WaveAndDistance]
Vector 30 [_CameraPosition]
Vector 31 [_CameraRight]
Vector 32 [_CameraUp]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c35, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c36, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c37, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c38, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c39, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c40, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c41, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c30
dp3 r0.x, r0, r0
slt r0.x, c29.w, r0
max r0.x, -r0, r0
slt r0.x, c34, r0
add r0.x, -r0, c34.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c31, v0
mad r0.xyz, r0.y, c32, r1
mul r0.w, r0.z, c29.y
mul r1.xyz, r0.w, c35
mul r0.w, r0.x, c29.y
mad r1, r0.w, c36, r1.xyyz
mov r0.w, c29.x
mad r1, c37, r0.w, r1
frc r1, r1
mad r1, r1, c34.z, c34.w
mul r2, r1, r1
mul r3, r2, r1
mad r1, r3, c35.w, r1
mul r3, r3, r2
mul r2, r3, r2
mad r1, r3, c38.x, r1
mad r1, r2, c38.y, r1
mul r1, r1, r1
mul r3, r1, r1
mul r1, r3, v1.y
mov r2.w, v0
dp4 r2.y, r1, c39
dp4 r2.x, r1, c40
mad r2.xz, -r2.xyyw, c29.z, r0
mov r2.y, r0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
mov oT4, r0
add r0.xyz, r2, -c30
dp3 r0.x, r0, r0
add r0.x, -r0, c29.w
mul r0.w, r0.x, c30
mov r0.xyz, c28
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mul r1.x, r0.w, c37.y
dp4 r0.w, r3, c41.xxyz
add r0.xyz, c38.z, r0
mad r0.xyz, r0.w, r0, c38.w
min r0.w, r1.x, c34.y
mul r0.xyz, r0, v5
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c34.x
mul oD0.xyz, r0, c37.y
mad oT5.xy, v3, c33, c33.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_CameraRight]
Vector 33 [_CameraUp]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[42] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..34],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[31];
DP3 R0.x, R0, R0;
SLT R0.x, c[30].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[32], vertex.position;
MAD R0.xyz, R0.y, c[33], R1;
MUL R0.w, R0.z, c[30].y;
MUL R1.xyz, R0.w, c[36];
MUL R0.w, R0.x, c[30].y;
MAD R2, R0.w, c[35], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[30].x, R2;
FRC R1, R1;
MUL R1, R1, c[36].w;
ADD R1, R1, -c[37].x;
MUL R2, R1, R1;
MUL R3, R2, R1;
MAD R1, R3, c[37].w, R1;
MUL R3, R3, R2;
MUL R2, R3, R2;
MAD R1, R3, c[37].z, R1;
MAD R1, R2, c[37].y, R1;
MUL R1, R1, R1;
MUL R3, R1, R1;
MUL R1, R3, vertex.attrib[14].y;
MOV R2.w, vertex.position;
DP4 R2.y, R1, c[38];
DP4 R2.x, R1, c[39];
MAD R2.xz, -R2.xyyw, c[30].z, R0;
MOV R2.y, R0;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
MOV result.texcoord[4], R0;
ADD R0.xyz, R2, -c[31];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[30].w;
MUL R0.y, R0.x, c[31].w;
DP4 R0.w, R3, c[40].xxyz;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MUL R1.x, R0.y, c[0].y;
MOV R0.x, c[40].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[40].w;
MIN R0.w, R1.x, c[41].x;
MUL R0.xyz, R0, vertex.color;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[41].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 68 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_WavingTint]
Vector 29 [_WaveAndDistance]
Vector 30 [_CameraPosition]
Vector 31 [_CameraRight]
Vector 32 [_CameraUp]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c35, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c36, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c37, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c38, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c39, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c40, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c41, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c30
dp3 r0.x, r0, r0
slt r0.x, c29.w, r0
max r0.x, -r0, r0
slt r0.x, c34, r0
add r0.x, -r0, c34.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c31, v0
mad r0.xyz, r0.y, c32, r1
mul r0.w, r0.z, c29.y
mul r1.xyz, r0.w, c35
mul r0.w, r0.x, c29.y
mad r1, r0.w, c36, r1.xyyz
mov r0.w, c29.x
mad r1, c37, r0.w, r1
frc r1, r1
mad r1, r1, c34.z, c34.w
mul r2, r1, r1
mul r3, r2, r1
mad r1, r3, c35.w, r1
mul r3, r3, r2
mul r2, r3, r2
mad r1, r3, c38.x, r1
mad r1, r2, c38.y, r1
mul r1, r1, r1
mul r3, r1, r1
mul r1, r3, v1.y
mov r2.w, v0
dp4 r2.y, r1, c39
dp4 r2.x, r1, c40
mad r2.xz, -r2.xyyw, c29.z, r0
mov r2.y, r0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
mov oT4, r0
add r0.xyz, r2, -c30
dp3 r0.x, r0, r0
add r0.x, -r0, c29.w
mul r0.w, r0.x, c30
mov r0.xyz, c28
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mul r1.x, r0.w, c37.y
dp4 r0.w, r3, c41.xxyz
add r0.xyz, c38.z, r0
mad r0.xyz, r0.w, r0, c38.w
min r0.w, r1.x, c34.y
mul r0.xyz, r0, v5
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c34.x
mul oD0.xyz, r0, c37.y
mad oT5.xy, v3, c33, c33.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedppfhiojakofgffknbilbpgdagppfeomfabaaaaaafiamaaaaadaaaaaa
cmaaaaaapeaaaaaaoaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefchaakaaaaeaaaabaajmacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaa
ahaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaabaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
aiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaabaaaaaaegiccaaaabaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
aoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaabaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaabcaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
bdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaa
diaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaa
aaaaaaajocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaapcaaaaiiccabaaaahaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaaeaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaa
agaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaag
iccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
aaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaa
ahaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedolcjojnfnnhoocbocimkhmjaeabbclcaabaaaaaamabcaaaaaeaaaaaa
daaaaaaajeagaaaaambbaaaanebbaaaaebgpgodjfmagaaaafmagaaaaaaacpopp
piafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaiaabaaaacaaaaaaaaaaacaaaaaaaiaabcaaaaaaaaaa
acaaamaaaeaabkaaaaaaaaaaadaaaaaaafaaboaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcdaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafceaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcfaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafcgaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafchaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafciaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafcjaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpfbaaaaafckaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejacaaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabpaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
cbaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaccaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiabpaaffkaafaaaaadacaaapiaabaaffiacdaajekaaeaaaaae
abaaapiaabaaaaiackaaoekaacaaoeiaabaaaaacacaaabiabpaaaakaaeaaaaae
abaaapiaacaaaaiaceaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiacfaaaakacfaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiacdaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiacfaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiacfaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiacgaajakaafaaaaadaaaaaiiaaaaappiacgaappkaajaaaaad
abaaabiaacaaoeiachaaoekaajaaaaadabaaaeiaacaaoeiaciaaoekaaeaaaaae
aaaaafiaabaaoeiabpaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeiacaaaoekb
aiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaibbpaappka
afaaaaadabaaabiaabaaaaiacaaappkaacaaaaadabaaabiaabaaaaiaabaaaaia
alaaaaadabaaabiaabaaaaiacjaakkkaakaaaaadagaaaioaabaaaaiacjaappka
abaaaaacabaaabiacjaaaakaacaaaaadabaaahiaabaaaaiaboaaoekaaeaaaaae
abaaahiaaaaappiaabaaoeiacjaaffkaacaaaaadabaaahiaabaaoeiaabaaoeia
afaaaaadagaaahoaabaaoeiaafaaoejaaeaaaaaeafaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaaiiaaaaaffiabhaakkkaaeaaaaaeaaaaaiiabgaakkka
aaaaaaiaaaaappiaaeaaaaaeaaaaaiiabiaakkkaaaaakkiaaaaappiaaeaaaaae
aaaaaiiabjaakkkaaaaappjaaaaappiaabaaaaacaeaaaioaaaaappibafaaaaad
abaaapiaaaaaffiablaaoekaafaaaaadacaaapiaaaaaffiabdaaoekaaeaaaaae
acaaapiabcaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaapiabeaaoekaaaaakkia
acaaoeiaaeaaaaaeacaaapiabfaaoekaaaaappjaacaaoeiaaeaaaaaeabaaapia
bkaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabmaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiabnaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffia
adaaoekaaeaaaaaeabaaahiaacaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
aeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahoaafaaoekaaaaappiaabaaoeia
afaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaaeabaaahiaagaaoekaaaaaaaia
abaaoeiaaeaaaaaeabaaahiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoa
ajaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaae
abaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaamaaoekaaaaakkia
abaaoeiaaeaaaaaeacaaahoaanaaoekaaaaappiaabaaoeiaafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabbaaoekaaaaappia
abaaoeiaabaaaaacaeaaahoaaaaaoeiaaeaaaaaeaaaaadmaacaappiaaaaaoeka
acaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefchaakaaaaeaaaabaa
jmacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
biaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaaadaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
gfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacaeaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
adaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaajaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaiaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaakaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
abaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
abaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaabeaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaa
bkaabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaaaaaaaaajocaabaaaabaaaaaa
agajbaaaaaaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaa
ahaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaacaaaaaaaeaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaagaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaa
dkbabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagiccabaaaafaaaaaaakaabaia
ebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaa
dcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaahaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_CameraRight]
Vector 33 [_CameraUp]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[42] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..34],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[31];
DP3 R0.x, R0, R0;
SLT R0.x, c[30].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[32], vertex.position;
MAD R0.xyz, R0.y, c[33], R1;
MUL R0.w, R0.z, c[30].y;
MUL R1.xyz, R0.w, c[36];
MUL R0.w, R0.x, c[30].y;
MAD R2, R0.w, c[35], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[30].x, R2;
FRC R1, R1;
MUL R1, R1, c[36].w;
ADD R1, R1, -c[37].x;
MUL R2, R1, R1;
MUL R3, R2, R1;
MAD R1, R3, c[37].w, R1;
MUL R3, R3, R2;
MUL R2, R3, R2;
MAD R1, R3, c[37].z, R1;
MAD R1, R2, c[37].y, R1;
MUL R1, R1, R1;
MUL R3, R1, R1;
MUL R1, R3, vertex.attrib[14].y;
MOV R2.w, vertex.position;
DP4 R2.y, R1, c[38];
DP4 R2.x, R1, c[39];
MAD R2.xz, -R2.xyyw, c[30].z, R0;
MOV R2.y, R0;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
MOV result.texcoord[4], R0;
ADD R0.xyz, R2, -c[31];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[30].w;
MUL R0.y, R0.x, c[31].w;
DP4 R0.w, R3, c[40].xxyz;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MUL R1.x, R0.y, c[0].y;
MOV R0.x, c[40].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[40].w;
MIN R0.w, R1.x, c[41].x;
MUL R0.xyz, R0, vertex.color;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[41].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 68 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_WavingTint]
Vector 29 [_WaveAndDistance]
Vector 30 [_CameraPosition]
Vector 31 [_CameraRight]
Vector 32 [_CameraUp]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c35, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c36, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c37, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c38, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c39, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c40, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c41, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c30
dp3 r0.x, r0, r0
slt r0.x, c29.w, r0
max r0.x, -r0, r0
slt r0.x, c34, r0
add r0.x, -r0, c34.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c31, v0
mad r0.xyz, r0.y, c32, r1
mul r0.w, r0.z, c29.y
mul r1.xyz, r0.w, c35
mul r0.w, r0.x, c29.y
mad r1, r0.w, c36, r1.xyyz
mov r0.w, c29.x
mad r1, c37, r0.w, r1
frc r1, r1
mad r1, r1, c34.z, c34.w
mul r2, r1, r1
mul r3, r2, r1
mad r1, r3, c35.w, r1
mul r3, r3, r2
mul r2, r3, r2
mad r1, r3, c38.x, r1
mad r1, r2, c38.y, r1
mul r1, r1, r1
mul r3, r1, r1
mul r1, r3, v1.y
mov r2.w, v0
dp4 r2.y, r1, c39
dp4 r2.x, r1, c40
mad r2.xz, -r2.xyyw, c29.z, r0
mov r2.y, r0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
mov oT4, r0
add r0.xyz, r2, -c30
dp3 r0.x, r0, r0
add r0.x, -r0, c29.w
mul r0.w, r0.x, c30
mov r0.xyz, c28
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mul r1.x, r0.w, c37.y
dp4 r0.w, r3, c41.xxyz
add r0.xyz, c38.z, r0
mad r0.xyz, r0.w, r0, c38.w
min r0.w, r1.x, c34.y
mul r0.xyz, r0, v5
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c34.x
mul oD0.xyz, r0, c37.y
mad oT5.xy, v3, c33, c33.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_CameraRight]
Vector 33 [_CameraUp]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[42] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..34],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.xyz, vertex.position, -c[31];
DP3 R0.x, R0, R0;
SLT R0.x, c[30].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[32], vertex.position;
MAD R0.xyz, R0.y, c[33], R1;
MUL R0.w, R0.z, c[30].y;
MUL R1.xyz, R0.w, c[36];
MUL R0.w, R0.x, c[30].y;
MAD R2, R0.w, c[35], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[30].x, R2;
FRC R1, R1;
MUL R1, R1, c[36].w;
ADD R1, R1, -c[37].x;
MUL R2, R1, R1;
MUL R3, R2, R1;
MAD R1, R3, c[37].w, R1;
MUL R3, R3, R2;
MUL R2, R3, R2;
MAD R1, R3, c[37].z, R1;
MAD R1, R2, c[37].y, R1;
MUL R1, R1, R1;
MUL R3, R1, R1;
MUL R1, R3, vertex.attrib[14].y;
MOV R2.w, vertex.position;
DP4 R2.y, R1, c[38];
DP4 R2.x, R1, c[39];
MAD R2.xz, -R2.xyyw, c[30].z, R0;
MOV R2.y, R0;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
MOV result.texcoord[4], R0;
ADD R0.xyz, R2, -c[31];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[30].w;
MUL R0.y, R0.x, c[31].w;
DP4 R0.w, R3, c[40].xxyz;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MUL R1.x, R0.y, c[0].y;
MOV R0.x, c[40].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[40].w;
MIN R0.w, R1.x, c[41].x;
MUL R0.xyz, R0, vertex.color;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[41].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 68 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_WavingTint]
Vector 29 [_WaveAndDistance]
Vector 30 [_CameraPosition]
Vector 31 [_CameraRight]
Vector 32 [_CameraUp]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c35, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c36, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c37, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c38, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c39, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c40, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c41, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c30
dp3 r0.x, r0, r0
slt r0.x, c29.w, r0
max r0.x, -r0, r0
slt r0.x, c34, r0
add r0.x, -r0, c34.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c31, v0
mad r0.xyz, r0.y, c32, r1
mul r0.w, r0.z, c29.y
mul r1.xyz, r0.w, c35
mul r0.w, r0.x, c29.y
mad r1, r0.w, c36, r1.xyyz
mov r0.w, c29.x
mad r1, c37, r0.w, r1
frc r1, r1
mad r1, r1, c34.z, c34.w
mul r2, r1, r1
mul r3, r2, r1
mad r1, r3, c35.w, r1
mul r3, r3, r2
mul r2, r3, r2
mad r1, r3, c38.x, r1
mad r1, r2, c38.y, r1
mul r1, r1, r1
mul r3, r1, r1
mul r1, r3, v1.y
mov r2.w, v0
dp4 r2.y, r1, c39
dp4 r2.x, r1, c40
mad r2.xz, -r2.xyyw, c29.z, r0
mov r2.y, r0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
mov oT4, r0
add r0.xyz, r2, -c30
dp3 r0.x, r0, r0
add r0.x, -r0, c29.w
mul r0.w, r0.x, c30
mov r0.xyz, c28
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mul r1.x, r0.w, c37.y
dp4 r0.w, r3, c41.xxyz
add r0.xyz, c38.z, r0
mad r0.xyz, r0.w, r0, c38.w
min r0.w, r1.x, c34.y
mul r0.xyz, r0, v5
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c34.x
mul oD0.xyz, r0, c37.y
mad oT5.xy, v3, c33, c33.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedppfhiojakofgffknbilbpgdagppfeomfabaaaaaafiamaaaaadaaaaaa
cmaaaaaapeaaaaaaoaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefchaakaaaaeaaaabaajmacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaa
ahaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaa
egiccaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaakaabaaaaaaaaaaadhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaak
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
aeaaaaaaigadbaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaa
agaabaaaabaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
acaaaaaadcaaaaanpcaabaaaabaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaadcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaak
icaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaia
ebaaaaaaabaaaaaakgikcaaaadaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaabaaaaaaajaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
aiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaaakaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaabaaaaaaegiccaaaabaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
aoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaabaaaaaaapaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaabcaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
bdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaabeaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaa
diaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaa
aaaaaaajocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaapcaaaaiiccabaaaahaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaaeaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaa
agaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaag
iccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
aaaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaa
ahaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
Vector 48 [_CameraRight] 3
Vector 64 [_CameraUp] 3
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedolcjojnfnnhoocbocimkhmjaeabbclcaabaaaaaamabcaaaaaeaaaaaa
daaaaaaajeagaaaaambbaaaanebbaaaaebgpgodjfmagaaaafmagaaaaaaacpopp
piafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaiaabaaaacaaaaaaaaaaacaaaaaaaiaabcaaaaaaaaaa
acaaamaaaeaabkaaaaaaaaaaadaaaaaaafaaboaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcdaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafceaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcfaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafcgaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafchaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafciaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafcjaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpfbaaaaafckaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaacaaaaadaaaaahiaaaaaoejacaaaoekb
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiabpaappkaaaaaaaia
aeaaaaaeaaaaadiaaaaaaaiaabaaoejbabaaoejaaeaaaaaeaaaaaniaaaaaaaia
cbaajekaaaaajejaaeaaaaaeaaaaahiaaaaaffiaccaaoekaaaaapiiaafaaaaad
abaaadiaaaaaoiiabpaaffkaafaaaaadacaaapiaabaaffiacdaajekaaeaaaaae
abaaapiaabaaaaiackaaoekaacaaoeiaabaaaaacacaaabiabpaaaakaaeaaaaae
abaaapiaacaaaaiaceaaoekaabaaoeiabdaaaaacabaaapiaabaaoeiaaeaaaaae
abaaapiaabaaoeiacfaaaakacfaaffkaafaaaaadacaaapiaabaaoeiaabaaoeia
afaaaaadadaaapiaabaaoeiaacaaoeiaaeaaaaaeabaaapiaadaaoeiacdaappka
abaaoeiaafaaaaadadaaapiaacaaoeiaadaaoeiaafaaaaadacaaapiaacaaoeia
adaaoeiaaeaaaaaeabaaapiaadaaoeiacfaakkkaabaaoeiaaeaaaaaeabaaapia
acaaoeiacfaappkaabaaoeiaafaaaaadabaaapiaabaaoeiaabaaoeiaafaaaaad
abaaapiaabaaoeiaabaaoeiaafaaaaadacaaapiaabaaoeiaabaaffjaajaaaaad
aaaaaiiaabaaoeiacgaajakaafaaaaadaaaaaiiaaaaappiacgaappkaajaaaaad
abaaabiaacaaoeiachaaoekaajaaaaadabaaaeiaacaaoeiaciaaoekaaeaaaaae
aaaaafiaabaaoeiabpaakkkbaaaaoeiaacaaaaadabaaahiaaaaaoeiacaaaoekb
aiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaadabaaabiaabaaaaibbpaappka
afaaaaadabaaabiaabaaaaiacaaappkaacaaaaadabaaabiaabaaaaiaabaaaaia
alaaaaadabaaabiaabaaaaiacjaakkkaakaaaaadagaaaioaabaaaaiacjaappka
abaaaaacabaaabiacjaaaakaacaaaaadabaaahiaabaaaaiaboaaoekaaeaaaaae
abaaahiaaaaappiaabaaoeiacjaaffkaacaaaaadabaaahiaabaaoeiaabaaoeia
afaaaaadagaaahoaabaaoeiaafaaoejaaeaaaaaeafaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaaiiaaaaaffiabhaakkkaaeaaaaaeaaaaaiiabgaakkka
aaaaaaiaaaaappiaaeaaaaaeaaaaaiiabiaakkkaaaaakkiaaaaappiaaeaaaaae
aaaaaiiabjaakkkaaaaappjaaaaappiaabaaaaacaeaaaioaaaaappibafaaaaad
abaaapiaaaaaffiablaaoekaafaaaaadacaaapiaaaaaffiabdaaoekaaeaaaaae
acaaapiabcaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaapiabeaaoekaaaaakkia
acaaoeiaaeaaaaaeacaaapiabfaaoekaaaaappjaacaaoeiaaeaaaaaeabaaapia
bkaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabmaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiabnaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffia
adaaoekaaeaaaaaeabaaahiaacaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
aeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahoaafaaoekaaaaappiaabaaoeia
afaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaaeabaaahiaagaaoekaaaaaaaia
abaaoeiaaeaaaaaeabaaahiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahoa
ajaaoekaaaaappiaabaaoeiaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaae
abaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaamaaoekaaaaakkia
abaaoeiaaeaaaaaeacaaahoaanaaoekaaaaappiaabaaoeiaafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoabbaaoekaaaaappia
abaaoeiaabaaaaacaeaaahoaaaaaoeiaaeaaaaaeaaaaadmaacaappiaaaaaoeka
acaaoeiaabaaaaacaaaaammaacaaoeiappppaaaafdeieefchaakaaaaeaaaabaa
jmacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
biaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaaadaaaaaa
afaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadhcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
gfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacaeaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
dbaaaaaibcaabaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaakaabaaaaaaaaaaa
dhaaaaamdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegbabaaaabaaaaaadcaaaaakncaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaadaaaaaaadaaaaaaagbjbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaaeaaaaaaigadbaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaaigaabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaacaaaaaafgafbaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaabaaaaaaagaabaaaabaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaacaaaaaadcaaaaanpcaabaaa
abaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaabaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
dcaaaaappcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaafgbfbaaaabaaaaaabbaaaaakicaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaaaaaaaaaagacbaiaebaaaaaaabaaaaaakgikcaaa
adaaaaaaabaaaaaaagacbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaajaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaiaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaakaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
abaaaaaaalaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
abaaaaaabfaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaabeaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaabgaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaa
bkaabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaaaaaaaaajocaabaaaabaaaaaa
agajbaaaaaaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaapcaaaaiiccabaaa
ahaaaaaapgipcaaaadaaaaaaacaaaaaafgafbaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaacaaaaaaaeaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaagaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaa
dkbabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagiccabaaaafaaaaaaakaabaia
ebaaaaaaaaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaa
dcaaaaamhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaahaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapahaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
MUL R0.w, R0, fragment.color.primary;
SLT R0.w, R0, c[4].x;
SLT R2, fragment.texcoord[4].w, c[2];
SGE R1, fragment.texcoord[4].w, c[1];
MUL R1, R1, R2;
MUL R0.xyz, R1.y, fragment.texcoord[1];
MAD R0.xyz, R1.x, fragment.texcoord[0], R0;
MAD R0.xyz, R1.z, fragment.texcoord[2], R0;
MAD R0.xyz, fragment.texcoord[3], R1.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[5].x;
TEX R0.x, R0, texture[1], 2D;
KIL -R0.w;
ADD R0.z, R0.x, -R0;
MOV R0.x, c[5];
CMP R1.x, R0.z, c[3], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[5].x;
MUL R0.xy, R0.y, c[5];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[5].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
dcl t5.xy
dcl v0.xyzw
texld r2, t5, s0
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r0, r0, c5.y, c5.x
cmp r1, r1, c5.x, c5.y
mul r1, r0, r1
mul r0.xyz, r1.y, t1
mad r2.xyz, r1.x, t0, r0
mad r1.xyz, r1.z, t2, r2
mul r0.w, r2, v0
add_pp r0.x, r0.w, -c4
mad r2.xyz, t3, r1.w, r1
cmp r0.x, r0, c5, c5.y
mov_pp r1, -r0.x
texld r0, r2, s1
texkill r1.xyzw
mul r1.x, -t4.w, c0.w
mov r2.x, c3
add r0.x, r0, -r2.z
cmp r0.x, r0, c5.y, r2
add r1.x, r1, c5.y
mul r2.xy, r1.x, c5.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c5.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c5
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[6] = { program.local[0..4],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
MUL R0.w, R0, fragment.color.primary;
SLT R0.w, R0, c[4].x;
SLT R2, fragment.texcoord[4].w, c[2];
SGE R1, fragment.texcoord[4].w, c[1];
MUL R1, R1, R2;
MUL R0.xyz, R1.y, fragment.texcoord[1];
MAD R0.xyz, R1.x, fragment.texcoord[0], R0;
MAD R0.xyz, R1.z, fragment.texcoord[2], R0;
MAD R0.xyz, fragment.texcoord[3], R1.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[5].x;
TEX R0.x, R0, texture[1], SHADOW2D;
KIL -R0.w;
MOV R0.y, c[5].x;
ADD R0.w, R0.y, -c[3].x;
MAD R1.x, R0, R0.w, c[3];
MUL R0.z, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0.z, c[5].x;
MUL R0.xy, R0.y, c[5];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[5].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
Float 4 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
dcl t5.xy
dcl v0.xyzw
texld r2, t5, s0
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r0, r0, c5.y, c5.x
cmp r1, r1, c5.x, c5.y
mul r1, r0, r1
mul r0.xyz, r1.y, t1
mad r2.xyz, r1.x, t0, r0
mad r1.xyz, r1.z, t2, r2
mul r0.w, r2, v0
add_pp r0.x, r0.w, -c4
mad r2.xyz, t3, r1.w, r1
cmp r0.x, r0, c5, c5.y
mov_pp r1, -r0.x
texld r0, r2, s1
texkill r1.xyzw
mov r2.x, c3
add r2.x, c5.y, -r2
mul r1.x, -t4.w, c0.w
mad r0.x, r0, r2, c3
add r1.x, r1, c5.y
mul r2.xy, r1.x, c5.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c5.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c5
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0
eefiecedfgbghioaagednjbodfhncmffiapenodmabaaaaaafeafaaaaadaaaaaa
cmaaaaaabiabaaaaemabaaaaejfdeheooeaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
adadaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcaaaeaaaaeaaaaaaaaaabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadicbabaaaafaaaaaa
gcbaaaaddcbabaaaagaaaaaagcbaaaadicbabaaaahaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaa
aaaaaaaadkbabaaaahaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
aaaaaaaabnaaaaaipcaabaaaaaaaaaaapgbpbaaaafaaaaaaegiocaaaacaaaaaa
agaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdbaaaaaipcaabaaaabaaaaaapgbpbaaaafaaaaaa
egiocaaaacaaaaaaahaaaaaaabaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
adaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaghabaaaabaaaaaaaagabaaaaaaaaaaackaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaacaaaaaabiaaaaaa
abeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaacaaaaaabiaaaaaadccaaaalccaabaaaaaaaaaaadkbabaaa
afaaaaaackiacaaaacaaaaaabiaaaaaadkiacaaaacaaaaaabiaaaaaaaacaaaah
bccabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaa
aaaaaaaadkbabaiaebaaaaaaafaaaaaadkiacaaaabaaaaaaafaaaaaaabeaaaaa
aaaaiadpdiaaaaakdcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaahpedaaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakeccabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadl
akaabaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaaf
cccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0_level_9_1
eefiecedcodggochcaglcflfgkbpeklfohmmcdkkabaaaaaaniahaaaaafaaaaaa
deaaaaaakaacaaaakiagaaaaliagaaaakeahaaaaebgpgodjgeacaaaageacaaaa
aaacppppaiacaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaa
abaaaaaaaaababaaaaaaaeaaabaaaaaaaaaaaaaaabaaafaaabaaabaaaaaaaaaa
acaaagaaacaaacaaaaaaaaaaacaabiaaabaaaeaaaaaaaaaaaaacppppfbaaaaaf
afaaapkaaaaaaaaaaaaaiadpaaaahpedibiaiadlbpaaaaacaaaaaaiaaaaaahla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaia
adaaahlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaiaafaaadlabpaaaaac
aaaaaaiaagaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
ecaaaaadaaaaapiaafaaoelaabaioekaaeaaaaaeaaaacpiaaaaappiaagaappla
aaaaaakbacaaaaadabaaapiaaeaapplaadaaoekbfiaaaaaeabaaapiaabaaoeia
afaaaakaafaaffkaacaaaaadacaaapiaaeaapplaacaaoekbfiaaaaaeabaaapia
acaaoeiaabaaoeiaafaaaakaafaaaaadacaaahiaabaaffiaabaaoelaaeaaaaae
acaaahiaaaaaoelaabaaaaiaacaaoeiaaeaaaaaeabaaahiaacaaoelaabaakkia
acaaoeiaaeaaaaaeabaaahiaadaaoelaabaappiaabaaoeiaebaaaaabaaaaapia
ecaaaaadaaaacpiaabaaoeiaaaaioekaabaaaaacaaaaaciaafaaffkabcaaaaae
abaacbiaaaaaaaiaaaaaffiaaeaaaakaaeaaaaaeaaaabbiaaeaapplaaeaakkka
aeaappkaacaaaaadabaadbiaaaaaaaiaabaaaaiaaeaaaaaeaaaaabiaaeaappla
abaappkbaaaaffiaafaaaaadaaaaadiaaaaaaaiaafaamjkabdaaaaacaaaaadia
aaaaoeiaaeaaaaaeabaaceiaaaaaffiaafaappkbaaaaaaiaabaaaaacabaaciia
aaaaffiaabaaaaacabaaaciaafaaffkaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcaaaeaaaaeaaaaaaaaaabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabjaaaaaa
fkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadicbabaaaafaaaaaagcbaaaaddcbabaaaagaaaaaa
gcbaaaadicbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaaaaaaaaaadkbabaaaahaaaaaa
akiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaabnaaaaaipcaabaaa
aaaaaaaapgbpbaaaafaaaaaaegiocaaaacaaaaaaagaaaaaaabaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
dbaaaaaipcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaacaaaaaaahaaaaaa
abaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aghabaaaabaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaaakiacaiaebaaaaaaacaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaacaaaaaa
biaaaaaadccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaa
biaaaaaadkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaadkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaa
bkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheooeaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaadadaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
ahaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[10] = { program.local[0..8],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
ADD R1.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
MUL R0.w, R0, fragment.color.primary;
SLT R0.w, R0, c[8].x;
DP3 R1.x, R1, R1;
ADD R0.xyz, fragment.texcoord[4], -c[2];
DP3 R1.y, R0, R0;
ADD R0.xyz, fragment.texcoord[4], -c[3];
DP3 R1.z, R0, R0;
DP3 R1.w, R2, R2;
SLT R2, R1, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[9].x;
TEX R0.x, R0, texture[1], 2D;
KIL -R0.w;
ADD R0.y, R0.x, -R0.z;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.x, c[9];
CMP R0.x, R0.y, c[6], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[9].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[9].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[9].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 36 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c9, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
dcl t5.xy
dcl v0.xyzw
texld r1, t5, s0
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.w, r2, r2
dp3 r0.z, r1, r1
add r0, r0, -c5
cmp r2, r0, c9.x, c9.y
mul r0.w, r1, v0
mov r0.x, r2.y
mov r0.y, r2.z
mov r0.z, r2.w
add_sat r0.xyz, r0, -r2
mul r1.xyz, r0.x, t1
mad r1.xyz, r2.x, t0, r1
mad r1.xyz, r0.y, t2, r1
add_pp r0.x, r0.w, -c8
mad r2.xyz, t3, r0.z, r1
cmp r0.x, r0, c9, c9.y
mov_pp r1, -r0.x
texld r0, r2, s1
texkill r1.xyzw
add r0.x, r0, -r2.z
mov r1.x, c6
add r2.xyz, -t4, c7
cmp r0.x, r0, c9.y, r1
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c9.y
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c9.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c9.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c9
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[10] = { program.local[0..8],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
ADD R1.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
MUL R0.w, R0, fragment.color.primary;
SLT R0.w, R0, c[8].x;
DP3 R1.x, R1, R1;
ADD R0.xyz, fragment.texcoord[4], -c[2];
DP3 R1.y, R0, R0;
ADD R0.xyz, fragment.texcoord[4], -c[3];
DP3 R1.z, R0, R0;
DP3 R1.w, R2, R2;
SLT R2, R1, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[9].x;
TEX R0.x, R0, texture[1], SHADOW2D;
KIL -R0.w;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.y, c[9].x;
ADD R0.y, R0, -c[6].x;
MAD R0.x, R0, R0.y, c[6];
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[9].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[9].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[9].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 36 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
Float 8 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c9, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
dcl t5.xy
dcl v0.xyzw
texld r1, t5, s0
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.w, r2, r2
dp3 r0.z, r1, r1
add r0, r0, -c5
cmp r2, r0, c9.x, c9.y
mul r0.w, r1, v0
mov r0.x, r2.y
mov r0.y, r2.z
mov r0.z, r2.w
add_sat r0.xyz, r0, -r2
mul r1.xyz, r0.x, t1
mad r1.xyz, r2.x, t0, r1
mad r1.xyz, r0.y, t2, r1
add_pp r0.x, r0.w, -c8
mad r2.xyz, t3, r0.z, r1
cmp r0.x, r0, c9, c9.y
mov_pp r1, -r0.x
texld r0, r2, s1
texkill r1.xyzw
mov r1.x, c6
add r1.x, c9.y, -r1
add r2.xyz, -t4, c7
mad r0.x, r0, r1, c6
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c9.y
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c9.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c9.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c9
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0
eefiecedfhopoombjhoaakdfnpbmkkhphidpcndkabaaaaaameagaaaaadaaaaaa
cmaaaaaabiabaaaaemabaaaaejfdeheooeaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
adadaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefchaafaaaaeaaaaaaafmabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabkaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaa
gcbaaaaddcbabaaaagaaaaaagcbaaaadicbabaaaahaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaagaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaaaaaaaaaadkaabaaa
aaaaaaaadkbabaaaahaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaadbaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaacaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaiaebaaaaaa
acaaaaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaadbaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaa
aeaaaaaadhaaaaaphcaabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaaaaaaceaaaaaaaaaaaiaaaaaaaiaaaaaaaiaaaaaaaaa
abaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgaobaaa
aaaaaaaadeaaaaakocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaa
egbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
aeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaghabaaaabaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaacaaaaaabiaaaaaaabeaaaaa
aaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaacaaaaaabiaaaaaaaaaaaaajocaabaaaaaaaaaaaagbjbaaaafaaaaaa
agijcaiaebaaaaaaacaaaaaabjaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dccaaaalccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaacaaaaaabiaaaaaa
dkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
dkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaabkaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 96
Float 64 [_Cutoff]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
"ps_4_0_level_9_1
eefiecedopalgpcncippdfdocnaoaihkmdpmdjpoabaaaaaadiakaaaaafaaaaaa
deaaaaaajaadaaaaaiajaaaabiajaaaaaeakaaaaebgpgodjfeadaaaafeadaaaa
aaacpppppiacaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaa
abaaaaaaaaababaaaaaaaeaaabaaaaaaaaaaaaaaabaaafaaabaaabaaaaaaaaaa
acaaaaaaafaaacaaaaaaaaaaacaabiaaacaaahaaaaaaaaaaaaacppppfbaaaaaf
ajaaapkaaaaaiadpaaaahpedibiaiadlaaaaaaaafbaaaaafakaaapkaaaaaaaaa
aaaaiadpaaaaaaiaaaaaialpbpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaia
abaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaac
aaaaaaiaaeaaaplabpaaaaacaaaaaaiaafaaadlabpaaaaacaaaaaaiaagaacpla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapia
afaaoelaabaioekaaeaaaaaeaaaacpiaaaaappiaagaapplaaaaaaakbacaaaaad
abaaahiaaeaaoelaacaaoekbaiaaaaadabaaabiaabaaoeiaabaaoeiaacaaaaad
acaaahiaaeaaoelaadaaoekbaiaaaaadabaaaciaacaaoeiaacaaoeiaacaaaaad
acaaahiaaeaaoelaaeaaoekbaiaaaaadabaaaeiaacaaoeiaacaaoeiaacaaaaad
acaaahiaaeaaoelaafaaoekbaiaaaaadabaaaiiaacaaoeiaacaaoeiaacaaaaad
abaaapiaabaaoeiaagaaoekbfiaaaaaeacaaahiaabaaoeiaakaakkkaakaappka
fiaaaaaeabaaapiaabaaoeiaakaaaakaakaaffkaacaaaaadadaaadiaacaaoeia
abaamjiaacaaaaadadaaaeiaacaakkiaabaappiaalaaaaadabaaaoiaadaablia
akaaaakaafaaaaadacaaahiaabaappiaabaaoelaaeaaaaaeacaaahiaaaaaoela
abaaaaiaacaaoeiaaeaaaaaeacaaahiaacaaoelaabaakkiaacaaoeiaaeaaaaae
abaaahiaadaaoelaabaaffiaacaaoeiaebaaaaabaaaaapiaecaaaaadaaaacpia
abaaoeiaaaaioekaabaaaaacaaaaaciaakaaffkabcaaaaaeabaacbiaaaaaaaia
aaaaffiaahaaaakaacaaaaadacaaahiaaeaaoelaaiaaoekbaiaaaaadaaaaabia
acaaoeiaacaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
aeaaaaaeaaaabbiaaaaaaaiaahaakkkaahaappkaacaaaaadabaadbiaaaaaaaia
abaaaaiaaeaaaaaeaaaaabiaaeaapplaabaappkbaaaaffiaafaaaaadaaaaadia
aaaaaaiaajaaoekabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeabaaceiaaaaaffia
ajaakkkbaaaaaaiaabaaaaacabaaciiaaaaaffiaabaaaaacabaacciaakaaffka
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefchaafaaaaeaaaaaaafmabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaa
afaaaaaagcbaaaaddcbabaaaagaaaaaagcbaaaadicbabaaaahaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
agaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkbabaaaahaaaaaaakiacaiaebaaaaaaaaaaaaaaaeaaaaaa
dbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaaegiccaia
ebaaaaaaacaaaaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaia
ebaaaaaaacaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaia
ebaaaaaaacaaaaaaacaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaegiccaia
ebaaaaaaacaaaaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaadbaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
acaaaaaaaeaaaaaadhaaaaaphcaabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaaaaaaceaaaaaaaaaaaiaaaaaaaiaaaaaaaia
aaaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaa
fgaobaaaaaaaaaaadeaaaaakocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
adaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaghabaaaabaaaaaaaagabaaaaaaaaaaackaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaacaaaaaabiaaaaaa
abeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaacaaaaaabiaaaaaaaaaaaaajocaabaaaaaaaaaaaagbjbaaa
afaaaaaaagijcaiaebaaaaaaacaaaaaabjaaaaaabaaaaaahccaabaaaaaaaaaaa
jgahbaaaaaaaaaaajgahbaaaaaaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadccaaaalccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaaacaaaaaa
biaaaaaadkiacaaaacaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaadkiacaaaabaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaakdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaaaaaaaaaa
bkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheooeaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
neaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaaneaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaadadaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
ahaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 Tags { "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
 Pass {
  Tags { "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="GrassBillboard" }
  Lighting On
  Cull Off
  AlphaTest Greater [_Cutoff]
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_LightPosition0]
Vector 19 [unity_LightPosition1]
Vector 20 [unity_LightPosition2]
Vector 21 [unity_LightPosition3]
Vector 22 [unity_LightAtten0]
Vector 23 [unity_LightAtten1]
Vector 24 [unity_LightAtten2]
Vector 25 [unity_LightAtten3]
Vector 26 [_WavingTint]
Vector 27 [_WaveAndDistance]
Vector 28 [_CameraPosition]
Vector 29 [_CameraRight]
Vector 30 [_CameraUp]
"!!ARBvp1.0
PARAM c[38] = { { 1.2, 2, 1.6, 4.8000002 },
		state.lightmodel.ambient,
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[14..30],
		{ 0.012, 0.02, 0.059999999, 0.024 },
		{ 0.0060000001, 0.02, 0.050000001, 6.4088488 },
		{ 3.1415927, -0.00019840999, 0.0083333002, -0.16161616 },
		{ 0.0060000001, 0.02, -0.02, 0.1 },
		{ 0.024, 0.039999999, -0.12, 0.096000001 },
		{ 0.47193992, 0.18877596, 0.094387978, 0.5 },
		{ 0, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, vertex.position, -c[28];
DP3 R0.x, R0, R0;
SLT R0.x, c[27].w, R0;
MAD R0.xy, -vertex.attrib[14], R0.x, vertex.attrib[14];
MAD R1.xyz, R0.x, c[29], vertex.position;
MAD R0.xyz, R0.y, c[30], R1;
MUL R0.w, R0.z, c[27].y;
MUL R1.xyz, R0.w, c[32];
MUL R0.w, R0.x, c[27].y;
MAD R2, R0.w, c[31], R1.xyyz;
MOV R1, c[0];
MAD R1, R1, c[27].x, R2;
FRC R1, R1;
MUL R1, R1, c[32].w;
ADD R1, R1, -c[33].x;
MUL R2, R1, R1;
MUL R3, R2, R1;
MAD R1, R3, c[33].w, R1;
MUL R3, R3, R2;
MOV R0.w, vertex.position;
MUL R2, R3, R2;
MAD R1, R3, c[33].z, R1;
MAD R1, R2, c[33].y, R1;
MUL R1, R1, R1;
MUL R1, R1, R1;
MUL R2, R1, vertex.attrib[14].y;
DP4 R3.x, R2, c[35];
DP4 R3.y, R2, c[34];
MAD R0.xz, -R3.xyyw, c[27].z, R0;
DP4 R2.z, R0, c[4];
DP4 R2.x, R0, c[2];
DP4 R2.y, R0, c[3];
MAD R3.xyz, -R2, c[19].w, c[19];
DP3 R2.w, R3, R3;
RSQ R3.w, R2.w;
MUL R4.xyz, R3.w, R3;
DP3 R3.z, vertex.normal, c[12];
DP3 R3.y, vertex.normal, c[11];
DP3 R3.x, vertex.normal, c[10];
DP3 R3.w, R3, R4;
MUL R4.x, R2.w, c[23].z;
MAX R2.w, R3, c[37].x;
ADD R3.w, R4.x, c[37].y;
MAD R4.xyz, -R2, c[18].w, c[18];
RCP R3.w, R3.w;
DP3 R4.w, R4, R4;
MUL R3.w, R2, R3;
RSQ R2.w, R4.w;
MUL R4.xyz, R2.w, R4;
DP3 R2.w, R3, R4;
MUL R4.w, R4, c[22].z;
ADD R4.w, R4, c[37].y;
RCP R4.x, R4.w;
MAX R2.w, R2, c[37].x;
MUL R2.w, R2, R4.x;
MAD R4.xyz, -R2, c[20].w, c[20];
MUL R5.xyz, R2.w, c[14];
DP3 R2.w, R4, R4;
RSQ R4.w, R2.w;
ADD R5.xyz, R5, c[1];
MAD R5.xyz, R3.w, c[15], R5;
MUL R3.w, R2, c[24].z;
MUL R4.xyz, R4.w, R4;
DP3 R2.w, R3, R4;
ADD R3.w, R3, c[37].y;
MAX R2.w, R2, c[37].x;
RCP R3.w, R3.w;
MUL R3.w, R2, R3;
MAD R2.xyz, -R2, c[21].w, c[21];
DP3 R2.w, R2, R2;
MAD R4.xyz, R3.w, c[16], R5;
RSQ R3.w, R2.w;
MUL R2.xyz, R3.w, R2;
DP3 R2.x, R3, R2;
MUL R2.w, R2, c[25].z;
ADD R2.w, R2, c[37].y;
MAX R2.x, R2, c[37];
RCP R2.y, R2.w;
MUL R2.y, R2.x, R2;
MAD R3.xyz, R2.y, c[17], R4;
MOV R2.x, c[36].w;
ADD R2.xyz, -R2.x, c[26];
DP4 R1.x, R1, c[36].xxyz;
MAD R1.xyz, R1.x, R2, c[36].w;
ADD R2.xyz, R0, -c[28];
MUL R1.xyz, R1, vertex.color;
MUL R1.xyz, R1, R3;
DP3 R1.w, R2, R2;
MUL result.color.xyz, R1, c[0].y;
ADD R1.x, -R1.w, c[27].w;
MUL R1.x, R1, c[28].w;
MUL R1.x, R1, c[0].y;
MIN R1.x, R1, c[37].y;
DP4 result.position.w, R0, c[9];
DP4 result.position.z, R0, c[8];
DP4 result.position.y, R0, c[7];
DP4 result.position.x, R0, c[6];
MAX result.color.w, R1.x, c[37].x;
MOV result.texcoord[0], vertex.texcoord[0];
END
# 99 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Vector 12 [glstate_lightmodel_ambient]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightColor2]
Vector 16 [unity_LightColor3]
Vector 17 [unity_LightPosition0]
Vector 18 [unity_LightPosition1]
Vector 19 [unity_LightPosition2]
Vector 20 [unity_LightPosition3]
Vector 21 [unity_LightAtten0]
Vector 22 [unity_LightAtten1]
Vector 23 [unity_LightAtten2]
Vector 24 [unity_LightAtten3]
Vector 25 [_WavingTint]
Vector 26 [_WaveAndDistance]
Vector 27 [_CameraPosition]
Vector 28 [_CameraRight]
Vector 29 [_CameraUp]
"vs_2_0
def c30, 0.00000000, 1.00000000, 6.40884876, -3.14159274
def c31, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c32, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c33, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c34, 0.00833330, -0.00019841, -0.50000000, 0.50000000
def c35, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c36, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c37, 0.47193992, 0.18877596, 0.09438798, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.xyz, v0, -c27
dp3 r0.x, r0, r0
slt r0.x, c26.w, r0
max r0.x, -r0, r0
slt r0.x, c30, r0
add r0.x, -r0, c30.y
mul r0.xy, r0.x, v1
mad r1.xyz, r0.x, c28, v0
mad r0.xyz, r0.y, c29, r1
mul r0.w, r0.z, c26.y
mul r1.xyz, r0.w, c31
mul r0.w, r0.x, c26.y
mad r1, r0.w, c32, r1.xyyz
mov r0.w, c26.x
mad r1, c33, r0.w, r1
frc r1, r1
mad r1, r1, c30.z, c30.w
mul r2, r1, r1
mul r3, r2, r1
mad r1, r3, c31.w, r1
mul r3, r3, r2
mov r0.w, v0
mul r2, r3, r2
mad r1, r3, c34.x, r1
mad r1, r2, c34.y, r1
mul r1, r1, r1
mul r1, r1, r1
mul r2, r1, v1.y
dp4 r3.x, r2, c36
dp4 r3.y, r2, c35
mad r0.xz, -r3.xyyw, c26.z, r0
dp4 r2.z, r0, c2
dp4 r2.x, r0, c0
dp4 r2.y, r0, c1
mad r3.xyz, -r2, c18.w, c18
dp3 r2.w, r3, r3
rsq r3.w, r2.w
mul r4.xyz, r3.w, r3
dp3 r3.z, v2, c10
dp3 r3.y, v2, c9
dp3 r3.x, v2, c8
dp3 r3.w, r3, r4
mul r4.x, r2.w, c22.z
max r2.w, r3, c30.x
add r3.w, r4.x, c30.y
mad r4.xyz, -r2, c17.w, c17
rcp r3.w, r3.w
dp3 r4.w, r4, r4
mul r3.w, r2, r3
rsq r2.w, r4.w
mul r4.xyz, r2.w, r4
dp3 r2.w, r3, r4
mul r4.w, r4, c21.z
add r4.w, r4, c30.y
rcp r4.x, r4.w
max r2.w, r2, c30.x
mul r2.w, r2, r4.x
mad r4.xyz, -r2, c19.w, c19
mul r5.xyz, r2.w, c13
dp3 r2.w, r4, r4
rsq r4.w, r2.w
add r5.xyz, r5, c12
mad r5.xyz, r3.w, c14, r5
mul r3.w, r2, c23.z
mul r4.xyz, r4.w, r4
dp3 r2.w, r3, r4
add r3.w, r3, c30.y
max r2.w, r2, c30.x
rcp r3.w, r3.w
mul r3.w, r2, r3
mad r2.xyz, -r2, c20.w, c20
dp3 r2.w, r2, r2
mad r4.xyz, r3.w, c15, r5
rsq r3.w, r2.w
mul r2.xyz, r3.w, r2
dp3 r2.x, r3, r2
mul r2.w, r2, c24.z
add r2.w, r2, c30.y
rcp r2.y, r2.w
max r2.x, r2, c30
mul r2.w, r2.x, r2.y
mov r2.xyz, c25
add r2.xyz, c34.z, r2
dp4 r1.x, r1, c37.xxyz
mad r1.xyz, r1.x, r2, c34.w
add r2.xyz, r0, -c27
mad r3.xyz, r2.w, c16, r4
mul r1.xyz, r1, v5
mul r1.xyz, r1, r3
dp3 r1.w, r2, r2
mul oD0.xyz, r1, c33.y
add r1.x, -r1.w, c26.w
mul r1.x, r1, c27.w
mul r1.x, r1, c33.y
min r1.x, r1, c30.y
dp4 oPos.w, r0, c7
dp4 oPos.z, r0, c6
dp4 oPos.y, r0, c5
dp4 oPos.x, r0, c4
max oD0.w, r1.x, c30.x
mov oT0, v3
"
}
}
  SetTexture [_MainTex] { combine texture * primary double, texture alpha * primary alpha }
 }
}
Fallback Off
}