Shader "Hidden/TerrainEngine/Details/WavingDoublePass" {
Properties {
 _WavingTint ("Fade Color", Color) = (0.7,0.6,0.5,0)
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
 _WaveAndDistance ("Wave and distance", Vector) = (12,3.6,1,1)
 _Cutoff ("Cutoff", Float) = 0.5
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
  Cull Off
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
MUL R0.x, vertex.position.z, c[18].y;
MUL R1.xyz, R0.x, c[22];
MUL R0.x, vertex.position, c[18].y;
MAD R1, R0.x, c[21], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[18].x, R1;
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
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[18].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[24];
DP4 R2.x, R0, c[25];
MAD R0.xz, -R2.xyyw, c[18].z, vertex.position;
MOV R0.yw, vertex.position;
ADD R2.xyz, R0, -c[19];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[18].w;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP4 R0.w, R1, c[26].xxyz;
MUL R1.xyz, vertex.normal, c[16].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
MUL R2.x, R2, c[19].w;
MUL R0.y, R2.x, c[0];
MIN R2.x, R0.y, c[27];
MOV R0.x, c[26].w;
ADD R0.xyz, -R0.x, c[17];
MAD R0.xyz, R0.w, R0, c[26].w;
MUL R0.xyz, vertex.color, R0;
MUL result.color.xyz, R0, c[0].y;
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[27].x;
MAX result.color.w, R2.x, c[27].y;
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 64 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c21, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c22, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c23, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c24, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c25, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c26, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c27, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c17.y
mul r1.xyz, r0.x, c20
mul r0.x, v0, c17.y
mad r1, r0.x, c21, r1.xyyz
mov r0.x, c17
mad r0, c22, r0.x, r1
frc r0, r0
mad r0, r0, c23.x, c23.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c20.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c23.z, r0
mad r0, r1, c23.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c17.z
mul r0, r1, r2.x
dp4 r2.y, r0, c24
dp4 r2.x, r0, c25
mov r0.yw, v0
mad r0.xz, -r2.xyyw, c17.z, v0
add r2.xyz, r0, -c18
dp3 r2.x, r2, r2
add r2.x, -r2, c17.w
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mul r2.x, r2, c18.w
mul r0.w, r2.x, c22.y
min r2.x, r0.w, c27.y
dp4 r0.w, r1, c26.xxyz
mul r1.xyz, v2, c15.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
mov r0.xyz, c16
add r0.xyz, c26.w, r0
mad r0.xyz, r0.w, r0, c27.x
mul r0.xyz, v5, r0
mul oD0.xyz, r0, c22.y
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.y
max oD0.w, r2.x, c27.z
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
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedailaibjncngbcfmnmcmmplkcabolgafcabaaaaaalmajaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcbmaiaaaa
eaaaabaaahacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
abaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedmnbfnmjnjnkpebfegfhlalbndjfmdildabaaaaaabiapaaaaaeaaaaaa
daaaaaaaiiafaaaakmanaaaaheaoaaaaebgpgodjfaafaaaafaafaaaaaaacpopp
oaaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaadaaaaaaadaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeafbaaaaafbfaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaaf
bgaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbhaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbiaaapkakgjlmedmaknhcddnipmcpfln
kgjlmednfbaaaaafbjaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaaf
bkaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafblaaapkakgjleedm
aknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaafaaaaad
aaaaadiaaaaaoijabcaaffkaafaaaaadabaaapiaaaaaffiabgaajekaaeaaaaae
aaaaapiaaaaaaaiablaaoekaabaaoeiaabaaaaacabaaabiabcaaaakaaeaaaaae
aaaaapiaabaaaaiabeaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabfaaaakabfaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiabgaappka
aaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeia
acaaoeiaaeaaaaaeaaaaapiaacaaoeiabfaakkkaaaaaoeiaaeaaaaaeaaaaapia
abaaoeiabfaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjabcaakkkaafaaaaad
abaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiabhaajakaafaaaaad
aaaaabiaaaaaaaiabhaappkaajaaaaadacaaabiaabaaoeiabiaaoekaajaaaaad
acaaaeiaabaaoeiabjaaoekaaeaaaaaeabaaafiaacaaoeiabcaakkkbaaaaoeja
abaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiabdaajakbaiaaaaad
aaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibbcaappkaafaaaaad
aaaaaciaaaaaffiabdaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaad
aaaaaciaaaaaffiabkaakkkaakaaaaadabaaaioaaaaaffiabkaappkaabaaaaac
acaaabiabkaaaakaacaaaaadaaaaaoiaacaaaaiabbaajakaaeaaaaaeaaaaahia
aaaaaaiaaaaapjiabkaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaad
abaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaooka
afaaaaadaaaaahiaacaaoejabaaappkaafaaaaadacaaahiaaaaaffiaaoaaoeka
aeaaaaaeaaaaaliaanaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiaapaaoeka
aaaakkiaaaaapeiaabaaaaacaaaaaiiabkaappkaajaaaaadacaaabiaacaaoeka
aaaaoeiaajaaaaadacaaaciaadaaoekaaaaaoeiaajaaaaadacaaaeiaaeaaoeka
aaaaoeiaafaaaaadadaaapiaaaaacjiaaaaakeiaajaaaaadaeaaabiaafaaoeka
adaaoeiaajaaaaadaeaaaciaagaaoekaadaaoeiaajaaaaadaeaaaeiaahaaoeka
adaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaaiiaaaaaffia
aaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoa
aaaaoeiaaeaaaaaeadaaahoaaiaaoekaaaaappiaacaaoeiaafaaaaadaaaaapia
aaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaabaaaaiaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefcbmaiaaaaeaaaabaaahacaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..13],
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
MUL R0.x, vertex.position.z, c[10].y;
MUL R1.xyz, R0.x, c[15];
MUL R0.x, vertex.position, c[10].y;
MAD R1, R0.x, c[14], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[10].x, R1;
FRC R0, R0;
MUL R0, R0, c[15].w;
ADD R0, R0, -c[16].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[16].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[16].z, R0;
MAD R0, R1, c[16].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[10].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[18];
MAD R0.xz, -R2.xyyw, c[10].z, vertex.position;
MOV R0.yw, vertex.position;
ADD R2.xyz, R0, -c[11];
DP3 R2.x, R2, R2;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
ADD R2.x, -R2, c[10].w;
MUL R0.y, R2.x, c[11].w;
MUL R0.w, R0.y, c[0].y;
MOV R0.x, c[19].w;
MIN R0.w, R0, c[20].x;
ADD R0.xyz, -R0.x, c[9];
DP4 R1.x, R1, c[19].xxyz;
MAD R0.xyz, R1.x, R0, c[19].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[20].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 43 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_WavingTint]
Vector 9 [_WaveAndDistance]
Vector 10 [_CameraPosition]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c14, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c15, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c16, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c17, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c18, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c19, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c20, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c9.y
mul r1.xyz, r0.x, c13
mul r0.x, v0, c9.y
mad r1, r0.x, c14, r1.xyyz
mov r0.x, c9
mad r0, c15, r0.x, r1
frc r0, r0
mad r0, r0, c16.x, c16.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c13.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c16.z, r0
mad r0, r1, c16.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c9.z
mul r0, r1, r2.x
dp4 r2.y, r0, c17
dp4 r2.x, r0, c18
mov r0.yw, v0
mad r0.xz, -r2.xyyw, c9.z, v0
add r2.xyz, r0, -c10
dp3 r2.x, r2, r2
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
add r2.x, -r2, c9.w
mul r0.w, r2.x, c10
mov r0.xyz, c8
mul r0.w, r0, c15.y
min r0.w, r0, c20.y
add r0.xyz, c19.w, r0
dp4 r1.x, r1, c19.xxyz
mad r0.xyz, r1.x, r0, c20.x
mul r0.xyz, v5, r0
max oD0.w, r0, c20.z
mul oD0.xyz, r0, c15.y
mad oT0.xy, v3, c12, c12.zwzw
mad oT1.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedjekihfmbklamiaphmbpcdchiglihmdkcabaaaaaajiahaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedadidmhdfkeikgehkafejejbpobkpobmpabaaaaaammalaaaaaeaaaaaa
daaaaaaagaaeaaaahiakaaaaeaalaaaaebgpgodjciaeaaaaciaeaaaaaaacpopp
nmadaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaafaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaacaaaaaaadaaahaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafakaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
fbaaaaafalaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafamaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafanaaapkafnjicmdphnbdikdo
hnbdakdodddddddpfbaaaaafaoaaapkakgjlmedmaknhcddnipmcpflnkgjlmedn
fbaaaaafapaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbaaaapka
aaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafbbaaapkakgjleedmaknhkddm
ipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaadia
aaaaoijaaiaaffkaafaaaaadabaaapiaaaaaffiaamaajekaaeaaaaaeaaaaapia
aaaaaaiabbaaoekaabaaoeiaabaaaaacabaaabiaaiaaaakaaeaaaaaeaaaaapia
abaaaaiaakaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiaalaaaakaalaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeiaafaaaaad
acaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaappkaaaaaoeia
afaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeia
aeaaaaaeaaaaapiaacaaoeiaalaakkkaaaaaoeiaaeaaaaaeaaaaapiaabaaoeia
alaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjaaiaakkkaafaaaaadabaaapia
aaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiaanaajakaafaaaaadaaaaabia
aaaaaaiaanaappkaajaaaaadacaaabiaabaaoeiaaoaaoekaajaaaaadacaaaeia
abaaoeiaapaaoekaaeaaaaaeabaaafiaacaaoeiaaiaakkkbaaaaoejaabaaaaac
abaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiaajaajakbaiaaaaadaaaaacia
aaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibaiaappkaafaaaaadaaaaacia
aaaaffiaajaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaadaaaaacia
aaaaffiabaaakkkaakaaaaadabaaaioaaaaaffiabaaappkaabaaaaacacaaabia
baaaaakaacaaaaadaaaaaoiaacaaaaiaahaajakaaeaaaaaeaaaaahiaaaaaaaia
aaaapjiabaaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoa
aaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..13],
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
MUL R0.x, vertex.position.z, c[10].y;
MUL R1.xyz, R0.x, c[15];
MUL R0.x, vertex.position, c[10].y;
MAD R1, R0.x, c[14], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[10].x, R1;
FRC R0, R0;
MUL R0, R0, c[15].w;
ADD R0, R0, -c[16].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[16].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[16].z, R0;
MAD R0, R1, c[16].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[10].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[18];
MAD R0.xz, -R2.xyyw, c[10].z, vertex.position;
MOV R0.yw, vertex.position;
ADD R2.xyz, R0, -c[11];
DP3 R2.x, R2, R2;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
ADD R2.x, -R2, c[10].w;
MUL R0.y, R2.x, c[11].w;
MUL R0.w, R0.y, c[0].y;
MOV R0.x, c[19].w;
MIN R0.w, R0, c[20].x;
ADD R0.xyz, -R0.x, c[9];
DP4 R1.x, R1, c[19].xxyz;
MAD R0.xyz, R1.x, R0, c[19].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[20].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 43 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_WavingTint]
Vector 9 [_WaveAndDistance]
Vector 10 [_CameraPosition]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c14, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c15, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c16, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c17, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c18, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c19, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c20, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c9.y
mul r1.xyz, r0.x, c13
mul r0.x, v0, c9.y
mad r1, r0.x, c14, r1.xyyz
mov r0.x, c9
mad r0, c15, r0.x, r1
frc r0, r0
mad r0, r0, c16.x, c16.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c13.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c16.z, r0
mad r0, r1, c16.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c9.z
mul r0, r1, r2.x
dp4 r2.y, r0, c17
dp4 r2.x, r0, c18
mov r0.yw, v0
mad r0.xz, -r2.xyyw, c9.z, v0
add r2.xyz, r0, -c10
dp3 r2.x, r2, r2
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
add r2.x, -r2, c9.w
mul r0.w, r2.x, c10
mov r0.xyz, c8
mul r0.w, r0, c15.y
min r0.w, r0, c20.y
add r0.xyz, c19.w, r0
dp4 r1.x, r1, c19.xxyz
mad r0.xyz, r1.x, r0, c20.x
mul r0.xyz, v5, r0
max oD0.w, r0, c20.z
mul oD0.xyz, r0, c15.y
mad oT0.xy, v3, c12, c12.zwzw
mad oT1.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedjekihfmbklamiaphmbpcdchiglihmdkcabaaaaaajiahaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 0 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 32 [_CameraPosition]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecedadidmhdfkeikgehkafejejbpobkpobmpabaaaaaammalaaaaaeaaaaaa
daaaaaaagaaeaaaahiakaaaaeaalaaaaebgpgodjciaeaaaaciaeaaaaaaacpopp
nmadaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaafaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaacaaaaaaadaaahaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafakaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
fbaaaaafalaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaafamaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafanaaapkafnjicmdphnbdikdo
hnbdakdodddddddpfbaaaaafaoaaapkakgjlmedmaknhcddnipmcpflnkgjlmedn
fbaaaaafapaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbaaaapka
aaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafbbaaapkakgjleedmaknhkddm
ipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaadia
aaaaoijaaiaaffkaafaaaaadabaaapiaaaaaffiaamaajekaaeaaaaaeaaaaapia
aaaaaaiabbaaoekaabaaoeiaabaaaaacabaaabiaaiaaaakaaeaaaaaeaaaaapia
abaaaaiaakaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiaalaaaakaalaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeiaafaaaaad
acaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaappkaaaaaoeia
afaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeia
aeaaaaaeaaaaapiaacaaoeiaalaakkkaaaaaoeiaaeaaaaaeaaaaapiaabaaoeia
alaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjaaiaakkkaafaaaaadabaaapia
aaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiaanaajakaafaaaaadaaaaabia
aaaaaaiaanaappkaajaaaaadacaaabiaabaaoeiaaoaaoekaajaaaaadacaaaeia
abaaoeiaapaaoekaaeaaaaaeabaaafiaacaaoeiaaiaakkkbaaaaoejaabaaaaac
abaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiaajaajakbaiaaaaadaaaaacia
aaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibaiaappkaafaaaaadaaaaacia
aaaaffiaajaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaadaaaaacia
aaaaffiabaaakkkaakaaaaadabaaaioaaaaaffiabaaappkaabaaaaacacaaabia
baaaaakaacaaaaadaaaaaoiaacaaaaiaahaajakaaeaaaaaeaaaaahiaaaaaaaia
aaaapjiabaaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoa
aaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafjaaaaaeegiocaaaacaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaa
kgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..21],
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
MUL R0.x, vertex.position.z, c[19].y;
MUL R1.xyz, R0.x, c[23];
MUL R0.x, vertex.position, c[19].y;
MAD R1, R0.x, c[22], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
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
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[19].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[25];
DP4 R3.x, R0, c[26];
MAD R2.xz, -R3.xyyw, c[19].z, vertex.position;
ADD R3.xyz, R2, -c[20];
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP3 R3.x, R3, R3;
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R4.xyz, R0.xyww, c[27].w;
MUL R4.y, R4, c[9].x;
MOV result.position, R0;
ADD R2.x, -R3, c[19].w;
MUL R0.x, R2, c[20].w;
MUL R0.y, R0.x, c[0];
MOV result.texcoord[3].zw, R0;
MIN R0.w, R0.y, c[28].x;
MOV R0.x, c[27].w;
ADD R2.xyz, -R0.x, c[18];
DP4 R0.x, R1, c[27].xxyz;
MUL R1.xyz, vertex.normal, c[17].w;
MAD R0.xyz, R0.x, R2, c[27].w;
MUL R0.xyz, vertex.color, R0;
DP3 R2.w, R1, c[6];
MUL result.color.xyz, R0, c[0].y;
DP3 R3.w, R1, c[7];
DP3 R0.x, R1, c[5];
MAX result.color.w, R0, c[28].y;
MOV R0.y, R2.w;
MOV R0.z, R3.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[28].x;
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c23, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c24, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c25, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c26, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c27, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c28, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c29, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c19.y
mul r1.xyz, r0.x, c22
mul r0.x, v0, c19.y
mad r1, r0.x, c23, r1.xyyz
mov r0.x, c19
mad r0, c24, r0.x, r1
frc r0, r0
mad r1, r0, c25.x, c25.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c22.w, r1
mul r2, r2, r0
mad r1, r2, c25.z, r1
mul r0, r2, r0
mad r0, r0, c25.w, r1
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c19.z
mul r0, r1, r2.x
dp4 r3.y, r0, c26
dp4 r3.x, r0, c27
mad r2.xz, -r3.xyyw, c19.z, v0
add r3.xyz, r2, -c20
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp3 r3.x, r3, r3
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r4.xyz, r0.xyww, c29.x
mul r4.y, r4, c8.x
add r2.x, -r3, c19.w
mov oPos, r0
mul r0.x, r2, c20.w
mov oT3.zw, r0
mul r0.w, r0.x, c24.y
mov r0.xyz, c18
add r2.xyz, c28.w, r0
dp4 r0.x, r1, c28.xxyz
mul r1.xyz, v2, c17.w
mad r0.xyz, r0.x, r2, c29.x
mul r0.xyz, v5, r0
dp3 r2.w, r1, c5
mul oD0.xyz, r0, c24.y
dp3 r3.w, r1, c6
dp3 r0.x, r1, c4
min r0.w, r0, c29.y
max oD0.w, r0, c29.z
mov r0.y, r2.w
mov r0.z, r3.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c29.y
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
mad oT0.xy, v3, c21, c21.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedodoajjnjddgioomohjmnddpmlkmocahiabaaaaaajiakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcoaaiaaaaeaaaabaadiacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
aeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaaf
ccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
jgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaa
aaaaaaaadkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaam
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedfbbiihcocpjnhdgngphkjbfnhcanodanabaaaaaadmbaaaaaaeaaaaaa
daaaaaaanaafaaaaliaoaaaaiaapaaaaebgpgodjjiafaaaajiafaaaaaaacpopp
bmafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaajaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaadaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbgaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbhaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbkaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafblaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
fbaaaaafbmaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabdaaffkaafaaaaadabaaapia
aaaaffiabhaajekaaeaaaaaeaaaaapiaaaaaaaiabmaaoekaabaaoeiaabaaaaac
abaaabiabdaaaakaaeaaaaaeaaaaapiaabaaaaiabfaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabgaaaakabgaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabhaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabgaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabgaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabdaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabiaajakaafaaaaadaaaaabiaaaaaaaiabiaappkaajaaaaadacaaabia
abaaoeiabjaaoekaajaaaaadacaaaeiaabaaoeiabkaaoekaaeaaaaaeabaaafia
acaaoeiabdaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabeaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbdaappkaafaaaaadaaaaaciaaaaaffiabeaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiablaakkkaakaaaaadabaaaioa
aaaaffiablaappkaabaaaaacacaaabiablaaaakaacaaaaadaaaaaoiaacaaaaia
bcaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiablaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoejabbaappkaafaaaaad
acaaahiaaaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaacaakeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiablaappka
ajaaaaadacaaabiaadaaoekaaaaaoeiaajaaaaadacaaaciaaeaaoekaaaaaoeia
ajaaaaadacaaaeiaafaaoekaaaaaoeiaafaaaaadadaaapiaaaaacjiaaaaakeia
ajaaaaadaeaaabiaagaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeia
ajaaaaadaeaaaeiaaiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeia
afaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaia
aaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaajaaoekaaaaappia
acaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
abaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaabaakkiaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeiablaaffka
afaaaaadabaaaiiaabaaffiaacaaaakaacaaaaadaeaaadoaabaakkiaabaaomia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaeaaamoaaaaaoeiappppaaaafdeieefcoaaiaaaaeaaaabaadiacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
aeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadgaaaaaf
ccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
jgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaa
aaaaaaaadkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaam
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..14],
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
MUL R0.x, vertex.position.z, c[11].y;
MUL R1.xyz, R0.x, c[16];
MUL R0.x, vertex.position, c[11].y;
MAD R1, R0.x, c[15], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[16].w;
ADD R0, R0, -c[17].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[17].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[17].z, R0;
MAD R0, R1, c[17].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[11].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[18];
DP4 R3.x, R0, c[19];
MAD R2.xz, -R3.xyyw, c[11].z, vertex.position;
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R3.xyz, R0.xyww, c[20].w;
MUL R3.y, R3, c[9].x;
ADD result.texcoord[2].xy, R3, R3.z;
ADD R3.xyz, R2, -c[12];
MOV result.position, R0;
DP3 R2.x, R3, R3;
ADD R0.x, -R2, c[11].w;
MUL R0.y, R0.x, c[12].w;
MOV result.texcoord[2].zw, R0;
MUL R2.x, R0.y, c[0].y;
MOV R0.x, c[20].w;
DP4 R0.w, R1, c[20].xxyz;
ADD R0.xyz, -R0.x, c[10];
MAD R0.xyz, R0.w, R0, c[20].w;
MIN R0.w, R2.x, c[21].x;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[21].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[13], c[13].zwzw;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c16, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c17, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c18, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c19, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c20, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c21, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c22, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c11.y
mul r1.xyz, r0.x, c15
mul r0.x, v0, c11.y
mad r1, r0.x, c16, r1.xyyz
mov r0.x, c11
mad r0, c17, r0.x, r1
frc r0, r0
mad r0, r0, c18.x, c18.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c15.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c18.z, r0
mad r0, r1, c18.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c11.z
mul r0, r1, r2.x
dp4 r3.y, r0, c19
dp4 r3.x, r0, c20
mad r2.xz, -r3.xyyw, c11.z, v0
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r3.xyz, r0.xyww, c22.x
mul r3.y, r3, c8.x
mad oT2.xy, r3.z, c9.zwzw, r3
add r3.xyz, r2, -c12
mov oPos, r0
dp3 r2.x, r3, r3
add r0.x, -r2, c11.w
mov oT2.zw, r0
mul r0.w, r0.x, c12
mul r2.x, r0.w, c17.y
mov r0.xyz, c10
dp4 r0.w, r1, c21.xxyz
add r0.xyz, c21.w, r0
mad r0.xyz, r0.w, r0, c22.x
min r0.w, r2.x, c22.y
mul r0.xyz, v5, r0
max oD0.w, r0, c22.z
mul oD0.xyz, r0, c17.y
mad oT0.xy, v3, c14, c14.zwzw
mad oT1.xy, v4, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjdkhccbgekbfckdckhnokdfmekimfkdeabaaaaaaheaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcneagaaaa
eaaaabaalfabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedmacigckmedhpoiioiefchdjidjinjklnabaaaaaapaamaaaaaeaaaaaa
daaaaaaakiaeaaaaiealaaaaemamaaaaebgpgodjhaaeaaaahaaeaaaaaaacpopp
biaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaajaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaadaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeafbaaaaafamaaapkaekbfmneanlapejmagfiiaidm
ehamfaljfbaaaaafanaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
aoaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafapaaapkakgjlmedm
aknhcddnipmcpflnkgjlmednfbaaaaafbaaaapkakgjlmedlaknhkddmaknhkdlm
mnmmmmdnfbaaaaafbbaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaaf
bcaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijaajaaffkaafaaaaadabaaapiaaaaaffia
anaajekaaeaaaaaeaaaaapiaaaaaaaiabcaaoekaabaaoeiaabaaaaacabaaabia
ajaaaakaaeaaaaaeaaaaapiaabaaaaiaalaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaamaaaakaamaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiaanaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiaamaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
ajaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
aoaajakaafaaaaadaaaaabiaaaaaaaiaaoaappkaajaaaaadacaaabiaabaaoeia
apaaoekaajaaaaadacaaaeiaabaaoeiabaaaoekaaeaaaaaeabaaafiaacaaoeia
ajaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
akaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
ajaappkaafaaaaadaaaaaciaaaaaffiaakaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiabbaakkkaakaaaaadabaaaioaaaaaffia
bbaappkaabaaaaacacaaabiabbaaaakaacaaaaadaaaaaoiaacaaaaiaaiaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiabbaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
acaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaad
aaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeiabbaaffkaafaaaaadabaaaiia
abaaffiaadaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiappppaaaafdeieefcneagaaaaeaaaabaalfabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaa
ajaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..14],
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
MUL R0.x, vertex.position.z, c[11].y;
MUL R1.xyz, R0.x, c[16];
MUL R0.x, vertex.position, c[11].y;
MAD R1, R0.x, c[15], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[16].w;
ADD R0, R0, -c[17].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[17].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[17].z, R0;
MAD R0, R1, c[17].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[11].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[18];
DP4 R3.x, R0, c[19];
MAD R2.xz, -R3.xyyw, c[11].z, vertex.position;
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R3.xyz, R0.xyww, c[20].w;
MUL R3.y, R3, c[9].x;
ADD result.texcoord[2].xy, R3, R3.z;
ADD R3.xyz, R2, -c[12];
MOV result.position, R0;
DP3 R2.x, R3, R3;
ADD R0.x, -R2, c[11].w;
MUL R0.y, R0.x, c[12].w;
MOV result.texcoord[2].zw, R0;
MUL R2.x, R0.y, c[0].y;
MOV R0.x, c[20].w;
DP4 R0.w, R1, c[20].xxyz;
ADD R0.xyz, -R0.x, c[10];
MAD R0.xyz, R0.w, R0, c[20].w;
MIN R0.w, R2.x, c[21].x;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[21].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[13], c[13].zwzw;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c16, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c17, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c18, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c19, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c20, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c21, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c22, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c11.y
mul r1.xyz, r0.x, c15
mul r0.x, v0, c11.y
mad r1, r0.x, c16, r1.xyyz
mov r0.x, c11
mad r0, c17, r0.x, r1
frc r0, r0
mad r0, r0, c18.x, c18.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c15.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c18.z, r0
mad r0, r1, c18.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c11.z
mul r0, r1, r2.x
dp4 r3.y, r0, c19
dp4 r3.x, r0, c20
mad r2.xz, -r3.xyyw, c11.z, v0
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r3.xyz, r0.xyww, c22.x
mul r3.y, r3, c8.x
mad oT2.xy, r3.z, c9.zwzw, r3
add r3.xyz, r2, -c12
mov oPos, r0
dp3 r2.x, r3, r3
add r0.x, -r2, c11.w
mov oT2.zw, r0
mul r0.w, r0.x, c12
mul r2.x, r0.w, c17.y
mov r0.xyz, c10
dp4 r0.w, r1, c21.xxyz
add r0.xyz, c21.w, r0
mad r0.xyz, r0.w, r0, c22.x
min r0.w, r2.x, c22.y
mul r0.xyz, v5, r0
max oD0.w, r0, c22.z
mul oD0.xyz, r0, c17.y
mad oT0.xy, v3, c14, c14.zwzw
mad oT1.xy, v4, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjdkhccbgekbfckdckhnokdfmekimfkdeabaaaaaaheaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcneagaaaa
eaaaabaalfabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedmacigckmedhpoiioiefchdjidjinjklnabaaaaaapaamaaaaaeaaaaaa
daaaaaaakiaeaaaaiealaaaaemamaaaaebgpgodjhaaeaaaahaaeaaaaaaacpopp
biaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaajaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaadaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeafbaaaaafamaaapkaekbfmneanlapejmagfiiaidm
ehamfaljfbaaaaafanaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
aoaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafapaaapkakgjlmedm
aknhcddnipmcpflnkgjlmednfbaaaaafbaaaapkakgjlmedlaknhkddmaknhkdlm
mnmmmmdnfbaaaaafbbaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaaf
bcaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijaajaaffkaafaaaaadabaaapiaaaaaffia
anaajekaaeaaaaaeaaaaapiaaaaaaaiabcaaoekaabaaoeiaabaaaaacabaaabia
ajaaaakaaeaaaaaeaaaaapiaabaaaaiaalaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaamaaaakaamaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiaanaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiaamaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
ajaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
aoaajakaafaaaaadaaaaabiaaaaaaaiaaoaappkaajaaaaadacaaabiaabaaoeia
apaaoekaajaaaaadacaaaeiaabaaoeiabaaaoekaaeaaaaaeabaaafiaacaaoeia
ajaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
akaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
ajaappkaafaaaaadaaaaaciaaaaaffiaakaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiabbaakkkaakaaaaadabaaaioaaaaaffia
bbaappkaabaaaaacacaaabiabbaaaakaacaaaaadaaaaaoiaacaaaaiaaiaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiabbaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
acaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaad
aaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeiabbaaffkaafaaaaadabaaaiia
abaaffiaadaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiappppaaaafdeieefcneagaaaaeaaaabaalfabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaa
ajaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 28 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[36] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..28],
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
MUL R0.x, vertex.position.z, c[26].y;
MUL R1.xyz, R0.x, c[30];
MUL R0.x, vertex.position, c[26].y;
MAD R1, R0.x, c[29], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[26].x, R1;
FRC R0, R0;
MUL R0, R0, c[30].w;
ADD R1, R0, -c[31].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[31].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[31].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[31].y, R1;
MUL R0, R0, R0;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[26].z;
MUL R1, R2, R1.x;
DP4 R0.y, R1, c[32];
DP4 R0.x, R1, c[33];
MAD R1.xz, -R0.xyyw, c[26].z, vertex.position;
MOV R1.yw, vertex.position;
DP4 R0.x, R1, c[6];
ADD R4, -R0.x, c[10];
MUL R0, R4, R4;
DP4 R3.x, R1, c[5];
ADD R3, -R3.x, c[9];
MOV R8.y, R7.w;
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
MOV R8.w, c[35].x;
RSQ R3.y, R5.y;
RSQ R3.z, R5.z;
RSQ R3.w, R5.w;
MUL R0, R0, R3;
ADD R3, R6, c[35].x;
RCP R3.x, R3.x;
RCP R3.y, R3.y;
RCP R3.w, R3.w;
RCP R3.z, R3.z;
MAX R0, R0, c[35].y;
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
MIN R0.w, R0, c[35].x;
MOV R0.x, c[34].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
ADD R1.xyz, -R0.x, c[25];
DP4 R0.x, R2, c[34].xxyz;
MAD R0.xyz, R0.x, R1, c[34].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[35].y;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].z, R4.x;
MOV result.texcoord[1].y, R7.w;
MOV result.texcoord[1].x, R8;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[28], c[28].zwzw;
END
# 94 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 27 [_MainTex_ST]
"vs_2_0
def c28, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c29, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c30, 0.00600000, 0.02000000, 0.05000000, -0.00019841
def c31, 6.40884876, -3.14159274, 0.00833330, -0.16161616
def c32, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c33, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c34, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c35, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r7.xyz, v2, c23.w
dp3 r7.w, r7, c5
dp3 r8.x, r7, c4
mul r0.x, v0.z, c25.y
mul r1.xyz, r0.x, c30
mul r0.x, v0, c25.y
mad r1, r0.x, c29, r1.xyyz
mov r0.x, c25
mad r0, c28, r0.x, r1
frc r0, r0
mad r1, r0, c31.x, c31.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c31.w, r1
mul r2, r2, r0
mad r1, r2, c31.z, r1
mul r0, r2, r0
mad r0, r0, c30.w, r1
mul r0, r0, r0
mul r2, r0, r0
mul r1.x, v5.w, c25.z
mul r1, r2, r1.x
dp4 r0.y, r1, c32
dp4 r0.x, r1, c33
mad r1.xz, -r0.xyyw, c25.z, v0
mov r1.yw, v0
dp4 r0.x, r1, c5
add r4, -r0.x, c9
mul r0, r4, r4
dp4 r3.x, r1, c4
add r3, -r3.x, c8
mov r8.y, r7.w
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
mov r8.w, c35.y
rsq r3.y, r5.y
rsq r3.z, r5.z
rsq r3.w, r5.w
mul r0, r0, r3
add r3, r6, c35.y
rcp r3.x, r3.x
rcp r3.y, r3.y
rcp r3.w, r3.w
rcp r3.z, r3.z
max r0, r0, c35.z
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
mul r0.w, r0, c28.y
min r0.w, r0, c35.y
mov r0.xyz, c24
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
add r1.xyz, c34.w, r0
dp4 r0.x, r2, c34.xxyz
mad r0.xyz, r0.x, r1, c35.x
mul r0.xyz, v5, r0
max oD0.w, r0, c35.z
mul oD0.xyz, r0, c28.y
mov oT1.z, r4.x
mov oT1.y, r7.w
mov oT1.x, r8
mad oT0.xy, v3, c27, c27.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedcmlakkpjpeakjipjbapjdfogjfbelekdabaaaaaaamanaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcgmalaaaa
eaaaabaanlacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaai
iccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajpcaabaaaadaaaaaaagaabaia
ebaaaaaaabaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaabaaaaaaegiocaaaabaaaaaaadaaaaaaaaaaaaajpcaabaaa
abaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaabaaaaaaaeaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaaaaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaabaaaaaakgakbaaaaaaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaabaaaaaadcaaaaanpcaabaaa
abaaaaaaegaobaaaabaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedecaofblfmhcicnefhlnbbhooecpncmkkabaaaaaagabeaaaaaeaaaaaa
daaaaaaaiaahaaaapebcaaaalmbdaaaaebgpgodjeiahaaaaeiahaaaaaaacpopp
mmagaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaacaaaiaaacaaaaaaaaaaabaacgaaahaaakaaaaaaaaaa
acaaaaaaaeaabbaaaaaaaaaaacaaamaaaeaabfaaaaaaaaaaacaabeaaabaabjaa
aaaaaaaaadaaaaaaadaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbnaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafboaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbpaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafcaaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafcbaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafccaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafcdaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafceaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijablaaffkaafaaaaadabaaapia
aaaaffiabnaajekaaeaaaaaeaaaaapiaaaaaaaiacbaaoekaabaaoeiaabaaaaac
abaaabiablaaaakaaeaaaaaeaaaaapiaabaaaaiaboaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabpaaaakabpaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabnaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabpaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabpaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjablaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiacaaajakaafaaaaadaaaaabiaaaaaaaiacaaappkaajaaaaadacaaabia
abaaoeiaccaaoekaajaaaaadacaaaeiaabaaoeiacdaaoekaaeaaaaaeabaaafia
acaaoeiablaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabmaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibblaappkaafaaaaadaaaaaciaaaaaffiabmaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiaceaakkkaakaaaaadabaaaioa
aaaaffiaceaappkaabaaaaacacaaajiaceaaoekaacaaaaadaaaaaoiaacaaaaia
bkaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiaceaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaafaaaaadaaaaahiaaaaaffjabgaaoekaaeaaaaae
aaaaahiabfaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaahiabhaaoekaabaakkia
aaaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaappjaaaaaoeiaacaaaaadadaaapia
aaaaffibadaaoekaafaaaaadaeaaapiaadaaoeiaadaaoeiaacaaaaadafaaapia
aaaaaaibacaaoekaacaaaaadaaaaapiaaaaakkibaeaaoekaaeaaaaaeaeaaapia
afaaoeiaafaaoeiaaeaaoeiaaeaaaaaeaeaaapiaaaaaoeiaaaaaoeiaaeaaoeia
ahaaaaacagaaabiaaeaaaaiaahaaaaacagaaaciaaeaaffiaahaaaaacagaaaeia
aeaakkiaahaaaaacagaaaiiaaeaappiaaeaaaaaeacaaapiaaeaaoeiaafaaoeka
acaappiaafaaaaadaeaaahiaacaaoejabjaappkaafaaaaadahaaahiaaeaaffia
bgaaoekaaeaaaaaeaeaaaliabfaakekaaeaaaaiaahaakeiaaeaaaaaeaeaaahia
bhaaoekaaeaakkiaaeaapeiaafaaaaadadaaapiaadaaoeiaaeaaffiaaeaaaaae
adaaapiaafaaoeiaaeaaaaiaadaaoeiaaeaaaaaeaaaaapiaaaaaoeiaaeaakkia
adaaoeiaafaaaaadaaaaapiaagaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeia
ceaakkkaagaaaaacadaaabiaacaaaaiaagaaaaacadaaaciaacaaffiaagaaaaac
adaaaeiaacaakkiaagaaaaacadaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeia
adaaoeiaafaaaaadacaaahiaaaaaffiaahaaoekaaeaaaaaeacaaahiaagaaoeka
aaaaaaiaacaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkiaacaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaappiaaaaaoeiaabaaaaacaeaaaiiaceaappkaajaaaaad
acaaabiaakaaoekaaeaaoeiaajaaaaadacaaaciaalaaoekaaeaaoeiaajaaaaad
acaaaeiaamaaoekaaeaaoeiaafaaaaadadaaapiaaeaacjiaaeaakeiaajaaaaad
afaaabiaanaaoekaadaaoeiaajaaaaadafaaaciaaoaaoekaadaaoeiaajaaaaad
afaaaeiaapaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaafaaoeiaafaaaaad
aaaaaiiaaeaaffiaaeaaffiaaeaaaaaeaaaaaiiaaeaaaaiaaeaaaaiaaaaappib
abaaaaacacaaahoaaeaaoeiaaeaaaaaeacaaahiabaaaoekaaaaappiaacaaoeia
acaaaaadadaaahoaaaaaoeiaacaaoeiaafaaaaadaaaaapiaaaaaffjabcaaoeka
aeaaaaaeaaaaapiabbaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiabdaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcgmalaaaaeaaaabaanlacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacagaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaa
adaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaa
aaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaa
dcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
ekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejma
nlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflo
lfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidm
gfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
bcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdo
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaak
bcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpfln
kgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaa
acaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaa
acaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaadaaaaaa
acaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajpcaabaaa
adaaaaaaagaabaiaebaaaaaaabaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaaj
pcaabaaaaeaaaaaafgafbaiaebaaaaaaabaaaaaaegiocaaaabaaaaaaadaaaaaa
aaaaaaajpcaabaaaabaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaabaaaaaa
aeaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaaaaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaabaaaaaakgakbaaaaaaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaabaaaaaa
dcaaaaanpcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaabaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[37] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..29],
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
MUL R0.x, vertex.position.z, c[27].y;
MUL R1.xyz, R0.x, c[31];
MUL R0.x, vertex.position, c[27].y;
MAD R1, R0.x, c[30], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[27].x, R1;
FRC R0, R0;
MUL R0, R0, c[31].w;
ADD R1, R0, -c[32].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[32].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[32].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[32].y, R1;
MUL R0, R0, R0;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[27].z;
MUL R1, R2, R1.x;
DP4 R0.y, R1, c[33];
DP4 R0.x, R1, c[34];
MAD R1.xz, -R0.xyyw, c[27].z, vertex.position;
MOV R1.yw, vertex.position;
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
MOV R8.y, R7.w;
MOV R8.z, R4.w;
RSQ R3.x, R5.x;
RSQ R3.y, R5.y;
RSQ R3.z, R5.z;
RSQ R3.w, R5.w;
MUL R0, R0, R3;
ADD R3, R6, c[36].x;
MOV R8.w, c[36].x;
RCP R3.x, R3.x;
RCP R3.y, R3.y;
RCP R3.w, R3.w;
RCP R3.z, R3.z;
MAX R0, R0, c[36].y;
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
MUL R5.xyz, R3.xyww, c[35].w;
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
MOV R0.x, c[35].w;
MUL R0.w, R0.y, c[0].y;
ADD R1.xyz, -R0.x, c[26];
DP4 R0.x, R2, c[35].xxyz;
MAD R0.xyz, R0.x, R1, c[35].w;
MIN R0.w, R0, c[36].x;
MUL R0.xyz, vertex.color, R0;
MOV result.position, R3;
MOV result.texcoord[3].zw, R3;
MAX result.color.w, R0, c[36].y;
MUL result.color.xyz, R0, c[0].y;
MOV result.texcoord[1].z, R4.w;
MOV result.texcoord[1].y, R7.w;
MOV result.texcoord[1].x, R8;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
END
# 100 instructions, 9 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 29 [_MainTex_ST]
"vs_2_0
def c30, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c31, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c32, 0.00600000, 0.02000000, 0.05000000, -0.00019841
def c33, 6.40884876, -3.14159274, 0.00833330, -0.16161616
def c34, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c35, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c36, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c37, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r7.xyz, v2, c25.w
dp3 r7.w, r7, c5
dp3 r8.x, r7, c4
mul r0.x, v0.z, c27.y
mul r1.xyz, r0.x, c32
mul r0.x, v0, c27.y
mad r1, r0.x, c31, r1.xyyz
mov r0.x, c27
mad r0, c30, r0.x, r1
frc r0, r0
mad r1, r0, c33.x, c33.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c33.w, r1
mul r2, r2, r0
mad r1, r2, c33.z, r1
mul r0, r2, r0
mad r0, r0, c32.w, r1
mul r0, r0, r0
mul r2, r0, r0
mul r1.x, v5.w, c27.z
mul r1, r2, r1.x
dp4 r0.y, r1, c34
dp4 r0.x, r1, c35
mad r1.xz, -r0.xyyw, c27.z, v0
mov r1.yw, v0
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
mov r8.y, r7.w
mov r8.z, r4.w
rsq r3.x, r5.x
rsq r3.y, r5.y
rsq r3.z, r5.z
rsq r3.w, r5.w
mul r0, r0, r3
add r3, r6, c37.y
mov r8.w, c37.y
rcp r3.x, r3.x
rcp r3.y, r3.y
rcp r3.w, r3.w
rcp r3.z, r3.z
max r0, r0, c37.z
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
mul r5.xyz, r3.xyww, c37.x
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
add r1.xyz, c36.w, r0
mul r0.w, r0, c30.y
dp4 r0.x, r2, c36.xxyz
mad r0.xyz, r0.x, r1, c37.x
min r0.w, r0, c37.y
mul r0.xyz, v5, r0
mov oPos, r3
mov oT3.zw, r3
max oD0.w, r0, c37.z
mul oD0.xyz, r0, c30.y
mov oT1.z, r4.w
mov oT1.y, r7.w
mov oT1.x, r8
mad oT0.xy, v3, c29, c29.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedllnjamnikmggcppnedpmfchodlahcdchabaaaaaaoianaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcdaamaaaaeaaaabaaamadaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
aeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagijcaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaa
aeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaa
aeaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaaeaaaaaa
acaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaadaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaeaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
afaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaa
afaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaa
afaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajpcaabaaa
aeaaaaaaagaabaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaafaaaaaafgafbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaadaaaaaa
aaaaaaajpcaabaaaabaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaa
aeaaaaaadiaaaaahpcaabaaaagaaaaaafgafbaaaaaaaaaaaegaobaaaafaaaaaa
diaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaaaaaaaaaegaobaaa
agaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaabaaaaaakgakbaaaaaaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaafaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaabaaaaaa
dcaaaaanpcaabaaaabaaaaaaegaobaaaabaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaabaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaa
acaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaafaaaaaa
kgaobaaaacaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecednkicecaffmalgbngkfgkhnhgfighnhjbabaaaaaaiebfaaaaaeaaaaaa
daaaaaaamiahaaaaaabeaaaamibeaaaaebgpgodjjaahaaaajaahaaaaaaacpopp
aiahaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaajaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaaeaabgaa
aaaaaaaaadaabeaaabaabkaaaaaaaaaaaeaaaaaaadaablaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafboaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
bpaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcaaaapkaekbfmnea
nlapejmagfiiaidmehamfaljfbaaaaafcbaaapkafnjicmdphnbdikdohnbdakdo
dddddddpfbaaaaafccaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaaf
cdaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafceaaapkakgjlmedl
aknhkddmaknhkdlmmnmmmmdnfbaaaaafcfaaapkaaaaaaalpaaaaaadpaaaaaaaa
aaaaiadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaadiaaaaaoija
bmaaffkaafaaaaadabaaapiaaaaaffiaboaajekaaeaaaaaeaaaaapiaaaaaaaia
ccaaoekaabaaoeiaabaaaaacabaaabiabmaaaakaaeaaaaaeaaaaapiaabaaaaia
bpaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
caaaaakacaaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapia
aaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiaboaappkaaaaaoeiaafaaaaad
acaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaae
aaaaapiaacaaoeiacaaakkkaaaaaoeiaaeaaaaaeaaaaapiaabaaoeiacaaappka
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadabaaabiaafaappjabmaakkkaafaaaaadabaaapiaaaaaoeia
abaaaaiaajaaaaadaaaaabiaaaaaoeiacbaajakaafaaaaadaaaaabiaaaaaaaia
cbaappkaajaaaaadacaaabiaabaaoeiacdaaoekaajaaaaadacaaaeiaabaaoeia
ceaaoekaaeaaaaaeabaaafiaacaaoeiabmaakkkbaaaaoejaabaaaaacabaaacia
aaaaffjaacaaaaadaaaaaoiaabaajaiabnaajakbaiaaaaadaaaaaciaaaaapjia
aaaapjiaacaaaaadaaaaaciaaaaaffibbmaappkaafaaaaadaaaaaciaaaaaffia
bnaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffia
cfaakkkaakaaaaadabaaaioaaaaaffiacfaappkaabaaaaacacaaajiacfaaoeka
acaaaaadaaaaaoiaacaaaaiablaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjia
cfaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeia
afaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahia
aaaaffjabhaaoekaaeaaaaaeaaaaahiabgaaoekaabaaaaiaaaaaoeiaaeaaaaae
aaaaahiabiaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappja
aaaaoeiaacaaaaadadaaapiaaaaaffibaeaaoekaafaaaaadaeaaapiaadaaoeia
adaaoeiaacaaaaadafaaapiaaaaaaaibadaaoekaacaaaaadaaaaapiaaaaakkib
afaaoekaaeaaaaaeaeaaapiaafaaoeiaafaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aaaaoeiaaaaaoeiaaeaaoeiaahaaaaacagaaabiaaeaaaaiaahaaaaacagaaacia
aeaaffiaahaaaaacagaaaeiaaeaakkiaahaaaaacagaaaiiaaeaappiaaeaaaaae
acaaapiaaeaaoeiaagaaoekaacaappiaafaaaaadaeaaahiaacaaoejabkaappka
afaaaaadahaaahiaaeaaffiabhaaoekaaeaaaaaeaeaaaliabgaakekaaeaaaaia
ahaakeiaaeaaaaaeaeaaahiabiaaoekaaeaakkiaaeaapeiaafaaaaadadaaapia
adaaoeiaaeaaffiaaeaaaaaeadaaapiaafaaoeiaaeaaaaiaadaaoeiaaeaaaaae
aaaaapiaaaaaoeiaaeaakkiaadaaoeiaafaaaaadaaaaapiaagaaoeiaaaaaoeia
alaaaaadaaaaapiaaaaaoeiacfaakkkaagaaaaacadaaabiaacaaaaiaagaaaaac
adaaaciaacaaffiaagaaaaacadaaaeiaacaakkiaagaaaaacadaaaiiaacaappia
afaaaaadaaaaapiaaaaaoeiaadaaoeiaafaaaaadacaaahiaaaaaffiaaiaaoeka
aeaaaaaeacaaahiaahaaoekaaaaaaaiaacaaoeiaaeaaaaaeaaaaahiaajaaoeka
aaaakkiaacaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaac
aeaaaiiacfaappkaajaaaaadacaaabiaalaaoekaaeaaoeiaajaaaaadacaaacia
amaaoekaaeaaoeiaajaaaaadacaaaeiaanaaoekaaeaaoeiaafaaaaadadaaapia
aeaacjiaaeaakeiaajaaaaadafaaabiaaoaaoekaadaaoeiaajaaaaadafaaacia
apaaoekaadaaoeiaajaaaaadafaaaeiabaaaoekaadaaoeiaacaaaaadacaaahia
acaaoeiaafaaoeiaafaaaaadaaaaaiiaaeaaffiaaeaaffiaaeaaaaaeaaaaaiia
aeaaaaiaaeaaaaiaaaaappibabaaaaacacaaahoaaeaaoeiaaeaaaaaeacaaahia
bbaaoekaaaaappiaacaaoeiaacaaaaadadaaahoaaaaaoeiaacaaoeiaafaaaaad
aaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaapiabeaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiabfaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeiacfaaffkaafaaaaadabaaaiia
abaaffiaacaaaakaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoa
aaaaoeiappppaaaafdeieefcdaamaaaaeaaaabaaamadaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaa
aeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacahaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaaeaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaai
iccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaaeaaaaaaacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaeaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
aeaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajpcaabaaaaeaaaaaaagaabaia
ebaaaaaaabaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaa
fgafbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaa
abaaaaaakgakbaiaebaaaaaaabaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaah
pcaabaaaagaaaaaafgafbaaaaaaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaa
afaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaagaabaaaaaaaaaaaegaobaaaagaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaabaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
afaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaabaaaaaadcaaaaanpcaabaaa
abaaaaaaegaobaaaabaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaa
egacbaaaadaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaacaaaaaa
aaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
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
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
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
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..18],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[20];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[19], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[20].w;
ADD R0, R0, -c[21].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[21].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[21].z, R0;
MAD R0, R1, c[21].y, R0;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R1.z, R0, c[22];
DP4 R1.x, R0, c[23];
MAD R1.xz, -R1, c[16].z, vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[13];
ADD R0.xyz, R1, -c[17];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[16].w;
MUL R0.x, R0, c[17].w;
MUL R0.y, R0.x, c[0];
MIN R0.w, R0.y, c[25].x;
MOV R0.x, c[24].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R1.x, R2, c[24].xxyz;
ADD R0.xyz, -R0.x, c[15];
MAD R0.xyz, R1.x, R0, c[24].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[25].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 54 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c25, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c15.y
mul r1.xyz, r0.x, c18
mul r0.x, v0, c15.y
mad r1, r0.x, c19, r1.xyyz
mov r0.x, c15
mad r0, c20, r0.x, r1
frc r0, r0
mad r0, r0, c21.x, c21.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.z, r0
mad r0, r1, c21.w, r0
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c15.z
mul r0, r2, r1.x
dp4 r1.z, r0, c22
dp4 r1.x, r0, c23
mad r1.xz, -r1, c15.z, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c12
add r0.xyz, r1, -c16
dp3 r0.x, r0, r0
add r0.x, -r0, c15.w
mul r0.x, r0, c16.w
mul r0.w, r0.x, c20.y
mov r0.xyz, c14
min r0.w, r0, c25.y
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 r1.x, r2, c24.xxyz
add r0.xyz, c24.w, r0
mad r0.xyz, r1.x, r0, c25.x
mul r1.xyz, v2, c13.w
mul r0.xyz, v5, r0
max oD0.w, r0, c25.z
mul oD0.xyz, r0, c20.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedhcaffkjmdcamamjcgdiinniinjimfonhabaaaaaaeaakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciiaiaaaaeaaaabaaccacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaan
pcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaa
kgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedbmgignahdcdknacpckdhnkcpblmbdloaabaaaaaammapaaaaaeaaaaaa
daaaaaaaliafaaaaeiaoaaaabaapaaaaebgpgodjiaafaaaaiaafaaaaaaacpopp
aeafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaadaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbeaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbfaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbgaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbhaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbiaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbjaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
fbaaaaafbkaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabbaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabkaaoekaabaaoeiaabaaaaac
abaaabiabbaaaakaaeaaaaaeaaaaapiaabaaaaiabdaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabeaaaakabeaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabeaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabeaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabbaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabgaajakaafaaaaadaaaaabiaaaaaaaiabgaappkaajaaaaadacaaabia
abaaoeiabhaaoekaajaaaaadacaaaeiaabaaoeiabiaaoekaaeaaaaaeabaaafia
acaaoeiabbaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabcaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbbaappkaafaaaaadaaaaaciaaaaaffiabcaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabjaakkkaakaaaaadabaaaioa
aaaaffiabjaappkaabaaaaacacaaabiabjaaaakaacaaaaadaaaaaoiaacaaaaia
baaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabjaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaad
acaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaacaakeia
aeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
amaaoekaaeaaaaaeaaaaahiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaahia
anaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
acaaahiaaaaaffiaacaaoekaaeaaaaaeacaaahiaabaaoekaaaaaaaiaacaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaacaaoeiaaeaaaaaeaeaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapia
ahaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefciiaiaaaa
eaaaabaaccacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_WavingTint]
Vector 12 [_WaveAndDistance]
Vector 13 [_CameraPosition]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..14],
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
MUL R0.x, vertex.position.z, c[12].y;
MUL R1.xyz, R0.x, c[16];
MUL R0.x, vertex.position, c[12].y;
MAD R1, R0.x, c[15], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[12].x, R1;
FRC R0, R0;
MUL R0, R0, c[16].w;
ADD R0, R0, -c[17].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[17].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[17].z, R0;
MAD R0, R1, c[17].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[12].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[19];
MAD R0.xz, -R2.xyyw, c[12].z, vertex.position;
MOV R0.yw, vertex.position;
ADD R2.xyz, R0, -c[13];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[12].w;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MUL R2.x, R2, c[13].w;
MUL R0.y, R2.x, c[0];
MIN R0.w, R0.y, c[21].x;
MOV R0.x, c[20].w;
DP4 R1.x, R1, c[20].xxyz;
ADD R0.xyz, -R0.x, c[11];
MAD R0.xyz, R1.x, R0, c[20].w;
MUL R1.xyz, vertex.normal, c[10].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[21].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[9];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_MainTex_ST]
"vs_2_0
def c14, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c15, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c16, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c17, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c18, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c19, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c20, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c21, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c11.y
mul r1.xyz, r0.x, c14
mul r0.x, v0, c11.y
mad r1, r0.x, c15, r1.xyyz
mov r0.x, c11
mad r0, c16, r0.x, r1
frc r0, r0
mad r0, r0, c17.x, c17.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c14.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c17.z, r0
mad r0, r1, c17.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c11.z
mul r0, r1, r2.x
dp4 r2.y, r0, c18
dp4 r2.x, r0, c19
mov r0.yw, v0
mad r0.xz, -r2.xyyw, c11.z, v0
add r2.xyz, r0, -c12
dp3 r2.x, r2, r2
add r2.x, -r2, c11.w
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mul r2.x, r2, c12.w
mul r0.w, r2.x, c16.y
mov r0.xyz, c10
min r0.w, r0, c21.y
dp4 r1.x, r1, c20.xxyz
add r0.xyz, c20.w, r0
mad r0.xyz, r1.x, r0, c21.x
mul r1.xyz, v2, c9.w
mul r0.xyz, v5, r0
max oD0.w, r0, c21.z
mul oD0.xyz, r0, c16.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c8
mad oT0.xy, v3, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedcogohkknelgcihambbcmlcjbedgboegeabaaaaaaeiaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefckiagaaaa
eaaaabaakkabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedefiobggbkajppjbchbgkdgdeamdkbgijabaaaaaaoaamaaaaaeaaaaaa
daaaaaaameaeaaaahealaaaadmamaaaaebgpgodjimaeaaaaimaeaaaaaaacpopp
bmaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabeaaabaaakaaaaaaaaaaadaaaaaaadaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafaoaaapkajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeafbaaaaafapaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaaf
baaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbbaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbcaaapkakgjlmedmaknhcddnipmcpfln
kgjlmednfbaaaaafbdaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaaf
beaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafbfaaapkakgjleedm
aknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaafaaaaad
aaaaadiaaaaaoijaamaaffkaafaaaaadabaaapiaaaaaffiabaaajekaaeaaaaae
aaaaapiaaaaaaaiabfaaoekaabaaoeiaabaaaaacabaaabiaamaaaakaaeaaaaae
aaaaapiaabaaaaiaaoaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiaapaaaakaapaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiabaaappka
aaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeia
acaaoeiaaeaaaaaeaaaaapiaacaaoeiaapaakkkaaaaaoeiaaeaaaaaeaaaaapia
abaaoeiaapaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjaamaakkkaafaaaaad
abaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiabbaajakaafaaaaad
aaaaabiaaaaaaaiabbaappkaajaaaaadacaaabiaabaaoeiabcaaoekaajaaaaad
acaaaeiaabaaoeiabdaaoekaaeaaaaaeabaaafiaacaaoeiaamaakkkbaaaaoeja
abaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiaanaajakbaiaaaaad
aaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibamaappkaafaaaaad
aaaaaciaaaaaffiaanaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaad
aaaaaciaaaaaffiabeaakkkaakaaaaadabaaaioaaaaaffiabeaappkaabaaaaac
acaaabiabeaaaakaacaaaaadaaaaaoiaacaaaaiaalaajakaaeaaaaaeaaaaahia
aaaaaaiaaaaapjiabeaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaad
abaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaooka
afaaaaadaaaaahiaacaaoejaakaappkaafaaaaadacaaahiaaaaaffiaaiaaoeka
aeaaaaaeaaaaaliaahaakekaaaaaaaiaacaakeiaaeaaaaaeacaaahoaajaaoeka
aaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapia
adaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacadaaahoaacaaoeka
ppppaaaafdeieefckiagaaaaeaaaabaakkabaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaa
bkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..18],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[20];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[19], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[20].w;
ADD R0, R0, -c[21].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[21].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[21].z, R0;
MAD R0, R1, c[21].y, R0;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R1.z, R0, c[22];
DP4 R1.x, R0, c[23];
MAD R1.xz, -R1, c[16].z, vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].w, R0, c[12];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[13];
ADD R0.xyz, R1, -c[17];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[16].w;
MUL R0.x, R0, c[17].w;
MUL R0.y, R0.x, c[0];
MIN R0.w, R0.y, c[25].x;
MOV R0.x, c[24].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R1.x, R2, c[24].xxyz;
ADD R0.xyz, -R0.x, c[15];
MAD R0.xyz, R1.x, R0, c[24].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[25].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 55 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c25, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c15.y
mul r1.xyz, r0.x, c18
mul r0.x, v0, c15.y
mad r1, r0.x, c19, r1.xyyz
mov r0.x, c15
mad r0, c20, r0.x, r1
frc r0, r0
mad r0, r0, c21.x, c21.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.z, r0
mad r0, r1, c21.w, r0
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c15.z
mul r0, r2, r1.x
dp4 r1.z, r0, c22
dp4 r1.x, r0, c23
mad r1.xz, -r1, c15.z, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.w, r0, c11
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c12
add r0.xyz, r1, -c16
dp3 r0.x, r0, r0
add r0.x, -r0, c15.w
mul r0.x, r0, c16.w
mul r0.w, r0.x, c20.y
mov r0.xyz, c14
min r0.w, r0, c25.y
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 r1.x, r2, c24.xxyz
add r0.xyz, c24.w, r0
mad r0.xyz, r1.x, r0, c25.x
mul r1.xyz, v2, c13.w
mul r0.xyz, v5, r0
max oD0.w, r0, c25.z
mul oD0.xyz, r0, c20.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedkhafpgopeailgjpepleidbmdoaddplioabaaaaaaeaakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciiaiaaaaeaaaabaaccacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaan
pcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaa
kgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedcnolnfgajakcfilghbdcojfhecbbmfbaabaaaaaammapaaaaaeaaaaaa
daaaaaaaliafaaaaeiaoaaaabaapaaaaebgpgodjiaafaaaaiaafaaaaaaacpopp
aeafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaadaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbeaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbfaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbgaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbhaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbiaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbjaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
fbaaaaafbkaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabbaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabkaaoekaabaaoeiaabaaaaac
abaaabiabbaaaakaaeaaaaaeaaaaapiaabaaaaiabdaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabeaaaakabeaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabeaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabeaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabbaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabgaajakaafaaaaadaaaaabiaaaaaaaiabgaappkaajaaaaadacaaabia
abaaoeiabhaaoekaajaaaaadacaaaeiaabaaoeiabiaaoekaaeaaaaaeabaaafia
acaaoeiabbaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabcaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbbaappkaafaaaaadaaaaaciaaaaaffiabcaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabjaakkkaakaaaaadabaaaioa
aaaaffiabjaappkaabaaaaacacaaabiabjaaaakaacaaaaadaaaaaoiaacaaaaia
baaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabjaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaad
acaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaacaakeia
aeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
amaaoekaaeaaaaaeaaaaahiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaahia
anaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
acaaapiaaaaaffiaacaaoekaaeaaaaaeacaaapiaabaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaadaaoekaaaaakkiaacaaoeiaaeaaaaaeaeaaapoaaeaaoeka
aaaappiaacaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapia
ahaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefciiaiaaaa
eaaaabaaccacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..18],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[20];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[19], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[20].w;
ADD R0, R0, -c[21].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[21].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[21].z, R0;
MAD R0, R1, c[21].y, R0;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R1.z, R0, c[22];
DP4 R1.x, R0, c[23];
MAD R1.xz, -R1, c[16].z, vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[13];
ADD R0.xyz, R1, -c[17];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[16].w;
MUL R0.x, R0, c[17].w;
MUL R0.y, R0.x, c[0];
MIN R0.w, R0.y, c[25].x;
MOV R0.x, c[24].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R1.x, R2, c[24].xxyz;
ADD R0.xyz, -R0.x, c[15];
MAD R0.xyz, R1.x, R0, c[24].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[25].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 54 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c25, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c15.y
mul r1.xyz, r0.x, c18
mul r0.x, v0, c15.y
mad r1, r0.x, c19, r1.xyyz
mov r0.x, c15
mad r0, c20, r0.x, r1
frc r0, r0
mad r0, r0, c21.x, c21.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.z, r0
mad r0, r1, c21.w, r0
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c15.z
mul r0, r2, r1.x
dp4 r1.z, r0, c22
dp4 r1.x, r0, c23
mad r1.xz, -r1, c15.z, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c12
add r0.xyz, r1, -c16
dp3 r0.x, r0, r0
add r0.x, -r0, c15.w
mul r0.x, r0, c16.w
mul r0.w, r0.x, c20.y
mov r0.xyz, c14
min r0.w, r0, c25.y
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 r1.x, r2, c24.xxyz
add r0.xyz, c24.w, r0
mad r0.xyz, r1.x, r0, c25.x
mul r1.xyz, v2, c13.w
mul r0.xyz, v5, r0
max oD0.w, r0, c25.z
mul oD0.xyz, r0, c20.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedhcaffkjmdcamamjcgdiinniinjimfonhabaaaaaaeaakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefciiaiaaaaeaaaabaaccacaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaan
pcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaa
kgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaadaaaaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaa
abaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedbmgignahdcdknacpckdhnkcpblmbdloaabaaaaaammapaaaaaeaaaaaa
daaaaaaaliafaaaaeiaoaaaabaapaaaaebgpgodjiaafaaaaiaafaaaaaaacpopp
aeafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaadaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbeaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbfaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbgaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbhaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbiaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbjaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
fbaaaaafbkaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabbaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabkaaoekaabaaoeiaabaaaaac
abaaabiabbaaaakaaeaaaaaeaaaaapiaabaaaaiabdaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabeaaaakabeaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabeaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabeaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabbaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabgaajakaafaaaaadaaaaabiaaaaaaaiabgaappkaajaaaaadacaaabia
abaaoeiabhaaoekaajaaaaadacaaaeiaabaaoeiabiaaoekaaeaaaaaeabaaafia
acaaoeiabbaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabcaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbbaappkaafaaaaadaaaaaciaaaaaffiabcaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabjaakkkaakaaaaadabaaaioa
aaaaffiabjaappkaabaaaaacacaaabiabjaaaakaacaaaaadaaaaaoiaacaaaaia
baaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabjaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaad
acaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaacaakeia
aeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
amaaoekaaeaaaaaeaaaaahiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaahia
anaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
abaakkiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
acaaahiaaaaaffiaacaaoekaaeaaaaaeacaaahiaabaaoekaaaaaaaiaacaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaacaaoeiaaeaaaaaeaeaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapia
ahaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefciiaiaaaa
eaaaabaaccacaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaegiccaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..18],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[20];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[19], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[20].w;
ADD R0, R0, -c[21].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[21].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[21].z, R0;
MAD R0, R1, c[21].y, R0;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R1.z, R0, c[22];
DP4 R1.x, R0, c[23];
MAD R1.xz, -R1, c[16].z, vertex.position;
DP4 R0.w, R1, c[8];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD R0.xyz, R1, -c[17];
DP3 R0.x, R0, R0;
ADD R0.x, -R0, c[16].w;
MUL R0.x, R0, c[17].w;
MUL R0.y, R0.x, c[0];
MIN R0.w, R0.y, c[25].x;
MOV R0.x, c[24].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
DP4 R1.x, R2, c[24].xxyz;
ADD R0.xyz, -R0.x, c[15];
MAD R0.xyz, R1.x, R0, c[24].w;
MUL R1.xyz, vertex.normal, c[14].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[25].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 53 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_WavingTint]
Vector 15 [_WaveAndDistance]
Vector 16 [_CameraPosition]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c19, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c20, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c21, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c22, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c23, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c24, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c25, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c15.y
mul r1.xyz, r0.x, c18
mul r0.x, v0, c15.y
mad r1, r0.x, c19, r1.xyyz
mov r0.x, c15
mad r0, c20, r0.x, r1
frc r0, r0
mad r0, r0, c21.x, c21.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c18.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c21.z, r0
mad r0, r1, c21.w, r0
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c15.z
mul r0, r2, r1.x
dp4 r1.z, r0, c22
dp4 r1.x, r0, c23
mad r1.xz, -r1, c15.z, v0
dp4 r0.w, r1, c7
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add r0.xyz, r1, -c16
dp3 r0.x, r0, r0
add r0.x, -r0, c15.w
mul r0.x, r0, c16.w
mul r0.w, r0.x, c20.y
mov r0.xyz, c14
min r0.w, r0, c25.y
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
dp4 r1.x, r2, c24.xxyz
add r0.xyz, c24.w, r0
mad r0.xyz, r1.x, r0, c25.x
mul r1.xyz, v2, c13.w
mul r0.xyz, v5, r0
max oD0.w, r0, c25.z
mul oD0.xyz, r0, c20.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c12
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedcghcihakfcaenbhmpcijklglaaelmokpabaaaaaajmajaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcoeahaaaaeaaaabaapjabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
adaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaan
pcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaa
kgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaaigcaabaaaaaaaaaaafgafbaaaacaaaaaaagibcaaaaaaaaaaa
aeaaaaaadcaaaaakgcaabaaaaaaaaaaaagibcaaaaaaaaaaaadaaaaaaagaabaaa
acaaaaaafgagbaaaaaaaaaaadcaaaaakgcaabaaaaaaaaaaaagibcaaaaaaaaaaa
afaaaaaakgakbaaaacaaaaaafgagbaaaaaaaaaaadcaaaaakmccabaaaabaaaaaa
agiecaaaaaaaaaaaagaaaaaapgapbaaaacaaaaaafgajbaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaaj
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
aaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaai
iccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedcojhpfgjnnclcbdmmkapijddkfmbalaoabaaaaaaniaoaaaaaeaaaaaa
daaaaaaagiafaaaafeanaaaabmaoaaaaebgpgodjdaafaaaadaafaaaaaaacpopp
leaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaajaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaadaaaaaaadaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafbeaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafbfaaapkakgjlmedlaknhkddmmnmmemdnlfhocflo
fbaaaaafbgaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbhaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbiaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafbjaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
fbaaaaafbkaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabbaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabkaaoekaabaaoeiaabaaaaac
abaaabiabbaaaakaaeaaaaaeaaaaapiaabaaaaiabdaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabeaaaakabeaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabeaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabeaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabbaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabgaajakaafaaaaadaaaaabiaaaaaaaiabgaappkaajaaaaadacaaabia
abaaoeiabhaaoekaajaaaaadacaaaeiaabaaoeiabiaaoekaaeaaaaaeabaaafia
acaaoeiabbaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabcaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbbaappkaafaaaaadaaaaaciaaaaaffiabcaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabjaakkkaakaaaaadabaaaioa
aaaaffiabjaappkaabaaaaacacaaabiabjaaaakaacaaaaadaaaaaoiaacaaaaia
baaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabjaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaad
acaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaacaakeia
aeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffja
amaaoekaaeaaaaaeaaaaapiaalaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeia
afaaaaadabaaakiaaaaaffiaacaacekaaeaaaaaeaaaaadiaabaaobkaaaaaaaia
abaaoniaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeaaaaamoa
aeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaae
aaaaapiaahaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaabaakkia
aaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacadaaahoa
agaaoekappppaaaafdeieefcoeahaaaaeaaaabaapjabaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaai
dcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaak
pcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaa
agiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaa
afaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaa
abaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaamaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
aoaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadiaaaaai
gcaabaaaaaaaaaaafgafbaaaacaaaaaaagibcaaaaaaaaaaaaeaaaaaadcaaaaak
gcaabaaaaaaaaaaaagibcaaaaaaaaaaaadaaaaaaagaabaaaacaaaaaafgagbaaa
aaaaaaaadcaaaaakgcaabaaaaaaaaaaaagibcaaaaaaaaaaaafaaaaaakgakbaaa
acaaaaaafgagbaaaaaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaaaaaaaaaa
agaaaaaapgapbaaaacaaaaaafgajbaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaa
bkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
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
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..13],
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
MUL R0.x, vertex.position.z, c[11].y;
MUL R1.xyz, R0.x, c[15];
MUL R0.x, vertex.position, c[11].y;
MAD R1, R0.x, c[14], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[15].w;
ADD R0, R0, -c[16].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[16].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[16].z, R0;
MAD R0, R1, c[16].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[11].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[18];
MAD R0.xz, -R2.xyyw, c[11].z, vertex.position;
MOV R0.yw, vertex.position;
ADD R2.xyz, R0, -c[12];
DP3 R2.x, R2, R2;
ADD R2.x, -R2, c[11].w;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MUL R2.x, R2, c[12].w;
MUL R0.y, R2.x, c[0];
MIN R0.w, R0.y, c[20].x;
MOV R0.x, c[19].w;
DP4 R1.x, R1, c[19].xxyz;
ADD R0.xyz, -R0.x, c[10];
MAD R0.xyz, R1.x, R0, c[19].w;
MUL R1.xyz, vertex.normal, c[9].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[20].y;
MUL result.color.xyz, R0, c[0].y;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
END
# 46 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c14, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c15, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c16, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c17, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c18, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c19, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c20, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c10.y
mul r1.xyz, r0.x, c13
mul r0.x, v0, c10.y
mad r1, r0.x, c14, r1.xyyz
mov r0.x, c10
mad r0, c15, r0.x, r1
frc r0, r0
mad r0, r0, c16.x, c16.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c13.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c16.z, r0
mad r0, r1, c16.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c10.z
mul r0, r1, r2.x
dp4 r2.y, r0, c17
dp4 r2.x, r0, c18
mov r0.yw, v0
mad r0.xz, -r2.xyyw, c10.z, v0
add r2.xyz, r0, -c11
dp3 r2.x, r2, r2
add r2.x, -r2, c10.w
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mul r2.x, r2, c11.w
mul r0.w, r2.x, c15.y
mov r0.xyz, c9
min r0.w, r0, c20.y
dp4 r1.x, r1, c19.xxyz
add r0.xyz, c19.w, r0
mad r0.xyz, r1.x, r0, c20.x
mul r1.xyz, v2, c8.w
mul r0.xyz, v5, r0
max oD0.w, r0, c20.z
mul oD0.xyz, r0, c15.y
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mad oT0.xy, v3, c12, c12.zwzw
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0
eefiecedgnaojnooijoekickolmhmkaeoeopggkiabaaaaaapmahaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcheagaaaaeaaaabaajnabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabfaaaaaafjaaaaaeegiocaaaacaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaacaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaacaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaa
bkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
abaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
abaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
abaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityTerrain" 2
"vs_4_0_level_9_1
eefiecediledandjeibfffolgiijfoplpopnbkafabaaaaaahmamaaaaaeaaaaaa
daaaaaaakmaeaaaacialaaaapaalaaaaebgpgodjheaeaaaaheaeaaaaaaacpopp
baaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaamaaadaaagaaaaaaaaaa
abaabeaaabaaajaaaaaaaaaaacaaaaaaadaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafanaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafaoaaapka
ekbfmneanlapejmagfiiaidmehamfaljfbaaaaafapaaapkakgjlmedlaknhkddm
mnmmemdnlfhocflofbaaaaafbaaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafbbaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbcaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbdaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpfbaaaaafbeaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijaalaaffka
afaaaaadabaaapiaaaaaffiaapaajekaaeaaaaaeaaaaapiaaaaaaaiabeaaoeka
abaaoeiaabaaaaacabaaabiaalaaaakaaeaaaaaeaaaaapiaabaaaaiaanaaoeka
aaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaaoaaaaka
aoaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeia
abaaoeiaaeaaaaaeaaaaapiaacaaoeiaapaappkaaaaaoeiaafaaaaadacaaapia
abaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapia
acaaoeiaaoaakkkaaaaaoeiaaeaaaaaeaaaaapiaabaaoeiaaoaappkaaaaaoeia
afaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeia
afaaaaadabaaabiaafaappjaalaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaia
ajaaaaadaaaaabiaaaaaoeiabaaajakaafaaaaadaaaaabiaaaaaaaiabaaappka
ajaaaaadacaaabiaabaaoeiabbaaoekaajaaaaadacaaaeiaabaaoeiabcaaoeka
aeaaaaaeabaaafiaacaaoeiaalaakkkbaaaaoejaabaaaaacabaaaciaaaaaffja
acaaaaadaaaaaoiaabaajaiaamaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjia
acaaaaadaaaaaciaaaaaffibalaappkaafaaaaadaaaaaciaaaaaffiaamaappka
acaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabdaakkka
akaaaaadabaaaioaaaaaffiabdaappkaabaaaaacacaaabiabdaaaakaacaaaaad
aaaaaoiaacaaaaiaakaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabdaaffka
acaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoeja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoeja
ajaappkaafaaaaadacaaahiaaaaaffiaahaaoekaaeaaaaaeaaaaaliaagaakeka
aaaaaaiaacaakeiaaeaaaaaeacaaahoaaiaaoekaaaaakkiaaaaapeiaafaaaaad
aaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcheagaaaaeaaaabaajnabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafjaaaaae
egiocaaaacaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaa
aaaaaaaaigbabaaaaaaaaaaafgifcaaaacaaaaaaabaaaaaadiaaaaakpcaabaaa
abaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaa
acaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
aaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
aaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaa
ckiacaaaacaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaacaaaaaaabaaaaaa
agbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaabaaaaaaaaaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
abaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaa
aaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaacaaaaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaacaaaaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaaacaaaaaaacaaaaaa
aaaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
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
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
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
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..21],
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
MUL R0.x, vertex.position.z, c[19].y;
MUL R1.xyz, R0.x, c[23];
MUL R0.x, vertex.position, c[19].y;
MAD R1, R0.x, c[22], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
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
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[19].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[25];
DP4 R3.x, R0, c[26];
MAD R2.xz, -R3.xyyw, c[19].z, vertex.position;
ADD R3.xyz, R2, -c[20];
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R4.xyz, R0.xyww, c[27].w;
MUL R4.y, R4, c[9].x;
DP3 R3.x, R3, R3;
MOV result.position, R0;
ADD R2.x, -R3, c[19].w;
MUL R0.x, R2, c[20].w;
MUL R0.y, R0.x, c[0];
MOV result.texcoord[1].zw, R0;
MIN R0.w, R0.y, c[28].x;
MOV R0.x, c[27].w;
ADD R2.xyz, -R0.x, c[18];
DP4 R0.x, R1, c[27].xxyz;
MAD R0.xyz, R0.x, R2, c[27].w;
MUL R0.xyz, vertex.color, R0;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.color.xyz, R0, c[0].y;
DP3 R2.w, R1, c[6];
MAX result.color.w, R0, c[28].y;
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[28].x;
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
END
# 65 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c23, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c24, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c25, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c26, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c27, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c28, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c29, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c19.y
mul r1.xyz, r0.x, c22
mul r0.x, v0, c19.y
mad r1, r0.x, c23, r1.xyyz
mov r0.x, c19
mad r0, c24, r0.x, r1
frc r0, r0
mad r1, r0, c25.x, c25.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c22.w, r1
mul r2, r2, r0
mad r1, r2, c25.z, r1
mul r0, r2, r0
mad r0, r0, c25.w, r1
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c19.z
mul r0, r1, r2.x
dp4 r3.y, r0, c26
dp4 r3.x, r0, c27
mad r2.xz, -r3.xyyw, c19.z, v0
add r3.xyz, r2, -c20
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r4.xyz, r0.xyww, c29.x
mul r4.y, r4, c8.x
dp3 r3.x, r3, r3
mov oPos, r0
add r2.x, -r3, c19.w
mul r0.x, r2, c20.w
mov oT1.zw, r0
mul r0.w, r0.x, c24.y
mov r0.xyz, c18
add r2.xyz, c28.w, r0
dp4 r0.x, r1, c28.xxyz
mad r0.xyz, r0.x, r2, c29.x
mul r0.xyz, v5, r0
mul r1.xyz, v2, c17.w
mul oD0.xyz, r0, c24.y
dp3 r2.w, r1, c5
min r0.w, r0, c29.y
max oD0.w, r0, c29.z
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c29.y
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
mad oT0.xy, v3, c21, c21.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedllmphdomohbnoobbfehnpeoiiddmeahjabaaaaaagaakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcmaaiaaaa
eaaaabaadaacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaaeaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaa
abaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaaeaaaaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjfcepbcmoafplmepdpeganfndmkcbpniabaaaaaapiapaaaaaeaaaaaa
daaaaaaameafaaaaimaoaaaafeapaaaaebgpgodjimafaaaaimafaaaaaaacpopp
baafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaadaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabdaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabjaaoekaabaaoeiaabaaaaac
abaaabiabdaaaakaaeaaaaaeaaaaapiaabaaaaiabgaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabhaaaakabhaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabhaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabhaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabdaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabiaajakaafaaaaadaaaaabiaaaaaaaiabiaappkaajaaaaadacaaabia
abaaoeiabkaaoekaajaaaaadacaaaeiaabaaoeiablaaoekaaeaaaaaeabaaafia
acaaoeiabdaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabeaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbdaappkaafaaaaadaaaaaciaaaaaffiabeaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabmaakkkaakaaaaadabaaaioa
aaaaffiabmaappkaabaaaaacacaaabiabmaaaakaacaaaaadaaaaaoiaacaaaaia
bcaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabmaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaabaakkia
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaapeiabmaaffkaafaaaaadabaaaiiaabaaffiaacaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaafaaaaadabaaahiaacaaoejabbaappkaafaaaaadacaaahia
abaaffiaapaaoekaaeaaaaaeabaaaliaaoaakekaabaaaaiaacaakeiaaeaaaaae
abaaahiabaaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabmaappkaajaaaaad
acaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoekaabaaoeiaajaaaaad
acaaaeiaafaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeiaajaaaaad
aeaaabiaagaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaad
aeaaaeiaaiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaad
abaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffib
aeaaaaaeadaaahoaajaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeia
ppppaaaafdeieefcmaaiaaaaeaaaabaadaacaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
adaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaai
dcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaa
afaaaaaackiacaaaaeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaa
abaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..19],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[21];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[20], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[21].w;
ADD R1, R0, -c[22].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[22].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[22].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[22].y, R1;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R3.y, R0, c[23];
DP4 R3.x, R0, c[24];
MAD R1.xz, -R3.xyyw, c[16].z, vertex.position;
ADD R3.xyz, R1, -c[17];
DP3 R3.x, R3, R3;
DP4 R0.w, R1, c[8];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MUL R4.xyz, R0.xyww, c[25].w;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R4.y, R4, c[13].x;
ADD R3.x, -R3, c[16].w;
MUL R0.x, R3, c[17].w;
MUL R0.w, R0.x, c[0].y;
MIN R0.w, R0, c[26].x;
MAX result.color.w, R0, c[26].y;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
ADD R0.xyz, R0, -c[14];
MUL result.texcoord[3].xyz, R0, c[14].w;
DP4 R0.w, R1, c[3];
MOV R0.y, c[25].w;
ADD R1.xyz, -R0.y, c[15];
DP4 R0.x, R2, c[25].xxyz;
MAD R0.xyz, R0.x, R1, c[25].w;
MOV R1.w, c[26].x;
ADD R1.x, R1.w, -c[14].w;
MUL R0.xyz, vertex.color, R0;
ADD result.texcoord[1].xy, R4, R4.z;
MUL result.texcoord[3].w, -R0, R1.x;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[18], c[18].zwzw;
END
# 57 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c21, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c22, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c23, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c24, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c25, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c26, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c27, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c16.y
mul r1.xyz, r0.x, c20
mul r0.x, v0, c16.y
mad r1, r0.x, c21, r1.xyyz
mov r0.x, c16
mad r0, c22, r0.x, r1
frc r0, r0
mad r1, r0, c23.x, c23.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c20.w, r1
mul r2, r2, r0
mad r1, r2, c23.z, r1
mul r0, r2, r0
mad r0, r0, c23.w, r1
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c16.z
mul r0, r2, r1.x
dp4 r3.y, r0, c24
dp4 r3.x, r0, c25
mad r1.xz, -r3.xyyw, c16.z, v0
add r3.xyz, r1, -c17
dp3 r3.x, r3, r3
dp4 r0.w, r1, c7
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mul r4.xyz, r0.xyww, c27.x
mov oPos, r0
mov oT1.zw, r0
mul r4.y, r4, c12.x
add r3.x, -r3, c16.w
mul r0.x, r3, c17.w
mul r0.w, r0.x, c22.y
min r0.w, r0, c27.z
max oD0.w, r0, c27.y
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
dp4 r0.w, r1, c2
add r0.xyz, r0, -c14
mul oT3.xyz, r0, c14.w
mov r1.xyz, c15
add r1.xyz, c26.w, r1
dp4 r0.x, r2, c26.xxyz
mad r0.xyz, r0.x, r1, c27.x
mov r1.w, c14
add r1.x, c27.z, -r1.w
mul r0.xyz, v5, r0
mad oT1.xy, r4.z, c13.zwzw, r4
mul oT3.w, -r0, r1.x
mul oD0.xyz, r0, c22.y
mad oT0.xy, v3, c19, c19.zwzw
mad oT2.xy, v4, c18, c18.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmoajljkiikljdhehebioaplmlnbjcnkiabaaaaaagaakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefckiaiaaaaeaaaabaackacaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaa
fjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
aeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaa
aaaaaaaaafaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaaeaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
ccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaa
aaaaaaaadkiacaaaaeaaaaaaacaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaa
acaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaabaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedoamcmpgmnjpjalbnehpnfkficfecaibeabaaaaaammapaaaaaeaaaaaa
daaaaaaajiafaaaaeiaoaaaabaapaaaaebgpgodjgaafaaaagaafaaaaaaacpopp
paaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaeaaaaaaadaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeafbaaaaafbfaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaaf
bgaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbhaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbiaaapkakgjlmedmaknhcddnipmcpfln
kgjlmednfbaaaaafbjaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaaf
bkaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafblaaapkakgjleedm
aknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaafaaaaad
aaaaadiaaaaaoijabcaaffkaafaaaaadabaaapiaaaaaffiabgaajekaaeaaaaae
aaaaapiaaaaaaaiablaaoekaabaaoeiaabaaaaacabaaabiabcaaaakaaeaaaaae
aaaaapiaabaaaaiabeaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabfaaaakabfaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiabgaappka
aaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeia
acaaoeiaaeaaaaaeaaaaapiaacaaoeiabfaakkkaaaaaoeiaaeaaaaaeaaaaapia
abaaoeiabfaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjabcaakkkaafaaaaad
abaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiabhaajakaafaaaaad
aaaaabiaaaaaaaiabhaappkaajaaaaadacaaabiaabaaoeiabiaaoekaajaaaaad
acaaaeiaabaaoeiabjaaoekaaeaaaaaeabaaafiaacaaoeiabcaakkkbaaaaoeja
abaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiabdaajakbaiaaaaad
aaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibbcaappkaafaaaaad
aaaaaciaaaaaffiabdaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaad
aaaaaciaaaaaffiabkaakkkaakaaaaadabaaaioaaaaaffiabkaappkaabaaaaac
acaaajiabkaaoekaacaaaaadaaaaaoiaacaaaaiabbaajakaaeaaaaaeaaaaahia
aaaaaaiaaaaapjiabkaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaad
abaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
afaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaabaaaaia
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaappjaaaaaoeiaafaaaaadadaaahiaaaaapeiabkaaffkaafaaaaad
adaaaiiaadaaffiaadaaaakaacaaaaadacaaadoaadaakkiaadaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadacaaahiaaaaaffjaaoaaoeka
aeaaaaaeacaaahiaanaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaapaaoeka
abaakkiaacaaoeiaaeaaaaaeacaaahiabaaaoekaaaaappjaacaaoeiaacaaaaad
acaaahiaacaaoeiaaeaaoekbafaaaaadadaaahoaacaaoeiaaeaappkaafaaaaad
abaaaciaaaaaffjaakaakkkaaeaaaaaeabaaabiaajaakkkaabaaaaiaabaaffia
aeaaaaaeabaaabiaalaakkkaabaakkiaabaaaaiaaeaaaaaeabaaabiaamaakkka
aaaappjaabaaaaiaacaaaaadabaaaciaacaappiaaeaappkbafaaaaadadaaaioa
abaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefckiaiaaaa
eaaaabaackacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaai
dcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaa
afaaaaaackiacaaaaeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaa
abaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
afaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaam
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaaakaabaaaaaaaaaaadkiacaaaaeaaaaaaacaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
acaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaa
adaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaa
akaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaagaaaaaackaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaa
aaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [unity_LightmapST]
Vector 10 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..10],
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
MUL R0.x, vertex.position.z, c[7].y;
MUL R1.xyz, R0.x, c[12];
MUL R0.x, vertex.position, c[7].y;
MAD R1, R0.x, c[11], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[12].w;
ADD R0, R0, -c[13].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[13].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[13].z, R0;
MAD R0, R1, c[13].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[7].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[15];
MAD R2.xz, -R3.xyyw, c[7].z, vertex.position;
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R3.xyz, R0.xyww, c[16].w;
MUL R3.y, R3, c[5].x;
ADD result.texcoord[1].xy, R3, R3.z;
ADD R3.xyz, R2, -c[8];
MOV result.position, R0;
DP3 R2.x, R3, R3;
ADD R0.x, -R2, c[7].w;
MUL R0.y, R0.x, c[8].w;
MOV result.texcoord[1].zw, R0;
MUL R2.x, R0.y, c[0].y;
MOV R0.x, c[16].w;
DP4 R0.w, R1, c[16].xxyz;
ADD R0.xyz, -R0.x, c[6];
MAD R0.xyz, R0.w, R0, c[16].w;
MIN R0.w, R2.x, c[17].x;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[17].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[9], c[9].zwzw;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [unity_LightmapST]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c12, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c13, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c14, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c15, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c16, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c17, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c18, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c7.y
mul r1.xyz, r0.x, c11
mul r0.x, v0, c7.y
mad r1, r0.x, c12, r1.xyyz
mov r0.x, c7
mad r0, c13, r0.x, r1
frc r0, r0
mad r0, r0, c14.x, c14.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c11.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c14.z, r0
mad r0, r1, c14.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c7.z
mul r0, r1, r2.x
dp4 r3.y, r0, c15
dp4 r3.x, r0, c16
mad r2.xz, -r3.xyyw, c7.z, v0
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r3.xyz, r0.xyww, c18.x
mul r3.y, r3, c4.x
mad oT1.xy, r3.z, c5.zwzw, r3
add r3.xyz, r2, -c8
mov oPos, r0
dp3 r2.x, r3, r3
add r0.x, -r2, c7.w
mov oT1.zw, r0
mul r0.w, r0.x, c8
mul r2.x, r0.w, c13.y
mov r0.xyz, c6
dp4 r0.w, r1, c17.xxyz
add r0.xyz, c17.w, r0
mad r0.xyz, r0.w, r0, c18.x
min r0.w, r2.x, c18.y
mul r0.xyz, v5, r0
max oD0.w, r0, c18.z
mul oD0.xyz, r0, c13.y
mad oT0.xy, v3, c10, c10.zwzw
mad oT2.xy, v4, c9, c9.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjmddhgcgjnoakcmjajhfpbpgoplacidiabaaaaaaheaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcneagaaaa
eaaaabaalfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecednkanhdnjpopapcmgnemkdofoglknonofabaaaaaapaamaaaaaeaaaaaa
daaaaaaakiaeaaaaiealaaaaemamaaaaebgpgodjhaaeaaaahaaeaaaaaaacpopp
biaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaadaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeafbaaaaafamaaapkaekbfmneanlapejmagfiiaidm
ehamfaljfbaaaaafanaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
aoaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafapaaapkakgjlmedm
aknhcddnipmcpflnkgjlmednfbaaaaafbaaaapkakgjlmedlaknhkddmaknhkdlm
mnmmmmdnfbaaaaafbbaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaaf
bcaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijaajaaffkaafaaaaadabaaapiaaaaaffia
anaajekaaeaaaaaeaaaaapiaaaaaaaiabcaaoekaabaaoeiaabaaaaacabaaabia
ajaaaakaaeaaaaaeaaaaapiaabaaaaiaalaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaamaaaakaamaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiaanaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiaamaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
ajaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
aoaajakaafaaaaadaaaaabiaaaaaaaiaaoaappkaajaaaaadacaaabiaabaaoeia
apaaoekaajaaaaadacaaaeiaabaaoeiabaaaoekaaeaaaaaeabaaafiaacaaoeia
ajaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
akaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
ajaappkaafaaaaadaaaaaciaaaaaffiaakaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiabbaakkkaakaaaaadabaaaioaaaaaffia
bbaappkaabaaaaacacaaabiabbaaaakaacaaaaadaaaaaoiaacaaaaiaaiaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiabbaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
acaaoekaacaaookaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapia
aeaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeia
bbaaffkaafaaaaadabaaaiiaabaaffiaadaaaakaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiappppaaaafdeieefcneagaaaaeaaaabaalfabaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaa
afaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..21],
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
MUL R0.x, vertex.position.z, c[19].y;
MUL R1.xyz, R0.x, c[23];
MUL R0.x, vertex.position, c[19].y;
MAD R1, R0.x, c[22], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[19].x, R1;
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
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[19].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[25];
DP4 R3.x, R0, c[26];
MAD R2.xz, -R3.xyyw, c[19].z, vertex.position;
ADD R3.xyz, R2, -c[20];
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R4.xyz, R0.xyww, c[27].w;
MUL R4.y, R4, c[9].x;
DP3 R3.x, R3, R3;
MOV result.position, R0;
ADD R2.x, -R3, c[19].w;
MUL R0.x, R2, c[20].w;
MUL R0.y, R0.x, c[0];
MOV result.texcoord[1].zw, R0;
MIN R0.w, R0.y, c[28].x;
MOV R0.x, c[27].w;
ADD R2.xyz, -R0.x, c[18];
DP4 R0.x, R1, c[27].xxyz;
MAD R0.xyz, R0.x, R2, c[27].w;
MUL R0.xyz, vertex.color, R0;
MUL R1.xyz, vertex.normal, c[17].w;
MUL result.color.xyz, R0, c[0].y;
DP3 R2.w, R1, c[6];
MAX result.color.w, R0, c[28].y;
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[28].x;
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
END
# 65 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c23, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c24, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c25, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c26, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c27, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c28, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c29, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c19.y
mul r1.xyz, r0.x, c22
mul r0.x, v0, c19.y
mad r1, r0.x, c23, r1.xyyz
mov r0.x, c19
mad r0, c24, r0.x, r1
frc r0, r0
mad r1, r0, c25.x, c25.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c22.w, r1
mul r2, r2, r0
mad r1, r2, c25.z, r1
mul r0, r2, r0
mad r0, r0, c25.w, r1
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c19.z
mul r0, r1, r2.x
dp4 r3.y, r0, c26
dp4 r3.x, r0, c27
mad r2.xz, -r3.xyyw, c19.z, v0
add r3.xyz, r2, -c20
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r4.xyz, r0.xyww, c29.x
mul r4.y, r4, c8.x
dp3 r3.x, r3, r3
mov oPos, r0
add r2.x, -r3, c19.w
mul r0.x, r2, c20.w
mov oT1.zw, r0
mul r0.w, r0.x, c24.y
mov r0.xyz, c18
add r2.xyz, c28.w, r0
dp4 r0.x, r1, c28.xxyz
mad r0.xyz, r0.x, r2, c29.x
mul r0.xyz, v5, r0
mul r1.xyz, v2, c17.w
mul oD0.xyz, r0, c24.y
dp3 r2.w, r1, c5
min r0.w, r0, c29.y
max oD0.w, r0, c29.z
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c29.y
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
mad oT0.xy, v3, c21, c21.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedllmphdomohbnoobbfehnpeoiiddmeahjabaaaaaagaakaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcmaaiaaaa
eaaaabaadaacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaaeaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaa
abaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaa
dkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaaeaaaaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedjfcepbcmoafplmepdpeganfndmkcbpniabaaaaaapiapaaaaaeaaaaaa
daaaaaaameafaaaaimaoaaaafeapaaaaebgpgodjimafaaaaimafaaaaaaacpopp
baafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaeaaaaaaadaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
kgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbgaaapkajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeafbaaaaafbhaaapkaekbfmneanlapejmagfiiaidmehamfalj
fbaaaaafbiaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafbjaaapka
kgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafbkaaapkakgjlmedmaknhcddn
ipmcpflnkgjlmednfbaaaaafblaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdn
fbaaaaafbmaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaafaaaaadaaaaadiaaaaaoijabdaaffkaafaaaaadabaaapia
aaaaffiabfaajekaaeaaaaaeaaaaapiaaaaaaaiabjaaoekaabaaoeiaabaaaaac
abaaabiabdaaaakaaeaaaaaeaaaaapiaabaaaaiabgaaoekaaaaaoeiabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabhaaaakabhaaffkaafaaaaad
abaaapiaaaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaae
aaaaapiaacaaoeiabfaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeia
afaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiabhaakkka
aaaaoeiaaeaaaaaeaaaaapiaabaaoeiabhaappkaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabia
afaappjabdaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabia
aaaaoeiabiaajakaafaaaaadaaaaabiaaaaaaaiabiaappkaajaaaaadacaaabia
abaaoeiabkaaoekaajaaaaadacaaaeiaabaaoeiablaaoekaaeaaaaaeabaaafia
acaaoeiabdaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoia
abaajaiabeaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaacia
aaaaffibbdaappkaafaaaaadaaaaaciaaaaaffiabeaappkaacaaaaadaaaaacia
aaaaffiaaaaaffiaalaaaaadaaaaaciaaaaaffiabmaakkkaakaaaaadabaaaioa
aaaaffiabmaappkaabaaaaacacaaabiabmaaaakaacaaaaadaaaaaoiaacaaaaia
bcaajakaaeaaaaaeaaaaahiaaaaaaaiaaaaapjiabmaaffkaacaaaaadaaaaahia
aaaaoeiaaaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaabaakkia
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaapeiabmaaffkaafaaaaadabaaaiiaabaaffiaacaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaafaaaaadabaaahiaacaaoejabbaappkaafaaaaadacaaahia
abaaffiaapaaoekaaeaaaaaeabaaaliaaoaakekaabaaaaiaacaakeiaaeaaaaae
abaaahiabaaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabmaappkaajaaaaad
acaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoekaabaaoeiaajaaaaad
acaaaeiaafaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeiaajaaaaad
aeaaabiaagaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaad
aeaaaeiaaiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaad
abaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffib
aeaaaaaeadaaahoaajaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeia
ppppaaaafdeieefcmaaiaaaaeaaaabaadaacaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafjaaaaaeegiocaaaaeaaaaaa
adaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaai
dcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaa
afaaaaaackiacaaaaeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaa
abaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaaeaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaaeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..19],
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
MUL R0.x, vertex.position.z, c[16].y;
MUL R1.xyz, R0.x, c[21];
MUL R0.x, vertex.position, c[16].y;
MAD R1, R0.x, c[20], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[16].x, R1;
FRC R0, R0;
MUL R0, R0, c[21].w;
ADD R1, R0, -c[22].x;
MUL R0, R1, R1;
MUL R2, R0, R1;
MAD R1, R2, c[22].w, R1;
MUL R2, R2, R0;
MAD R1, R2, c[22].z, R1;
MUL R0, R2, R0;
MAD R0, R0, c[22].y, R1;
MUL R0, R0, R0;
MOV R1.yw, vertex.position;
MUL R2, R0, R0;
MUL R1.x, vertex.color.w, c[16].z;
MUL R0, R2, R1.x;
DP4 R3.y, R0, c[23];
DP4 R3.x, R0, c[24];
MAD R1.xz, -R3.xyyw, c[16].z, vertex.position;
ADD R3.xyz, R1, -c[17];
DP3 R3.x, R3, R3;
DP4 R0.w, R1, c[8];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MUL R4.xyz, R0.xyww, c[25].w;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R4.y, R4, c[13].x;
ADD R3.x, -R3, c[16].w;
MUL R0.x, R3, c[17].w;
MUL R0.w, R0.x, c[0].y;
MIN R0.w, R0, c[26].x;
MAX result.color.w, R0, c[26].y;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
ADD R0.xyz, R0, -c[14];
MUL result.texcoord[3].xyz, R0, c[14].w;
DP4 R0.w, R1, c[3];
MOV R0.y, c[25].w;
ADD R1.xyz, -R0.y, c[15];
DP4 R0.x, R2, c[25].xxyz;
MAD R0.xyz, R0.x, R1, c[25].w;
MOV R1.w, c[26].x;
ADD R1.x, R1.w, -c[14].w;
MUL R0.xyz, vertex.color, R0;
ADD result.texcoord[1].xy, R4, R4.z;
MUL result.texcoord[3].w, -R0, R1.x;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[18], c[18].zwzw;
END
# 57 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [_WavingTint]
Vector 16 [_WaveAndDistance]
Vector 17 [_CameraPosition]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c21, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c22, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c23, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c24, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c25, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c26, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c27, 0.50000000, 0.00000000, 1.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c16.y
mul r1.xyz, r0.x, c20
mul r0.x, v0, c16.y
mad r1, r0.x, c21, r1.xyyz
mov r0.x, c16
mad r0, c22, r0.x, r1
frc r0, r0
mad r1, r0, c23.x, c23.y
mul r0, r1, r1
mul r2, r0, r1
mad r1, r2, c20.w, r1
mul r2, r2, r0
mad r1, r2, c23.z, r1
mul r0, r2, r0
mad r0, r0, c23.w, r1
mul r0, r0, r0
mov r1.yw, v0
mul r2, r0, r0
mul r1.x, v5.w, c16.z
mul r0, r2, r1.x
dp4 r3.y, r0, c24
dp4 r3.x, r0, c25
mad r1.xz, -r3.xyyw, c16.z, v0
add r3.xyz, r1, -c17
dp3 r3.x, r3, r3
dp4 r0.w, r1, c7
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mul r4.xyz, r0.xyww, c27.x
mov oPos, r0
mov oT1.zw, r0
mul r4.y, r4, c12.x
add r3.x, -r3, c16.w
mul r0.x, r3, c17.w
mul r0.w, r0.x, c22.y
min r0.w, r0, c27.z
max oD0.w, r0, c27.y
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
dp4 r0.w, r1, c2
add r0.xyz, r0, -c14
mul oT3.xyz, r0, c14.w
mov r1.xyz, c15
add r1.xyz, c26.w, r1
dp4 r0.x, r2, c26.xxyz
mad r0.xyz, r0.x, r1, c27.x
mov r1.w, c14
add r1.x, c27.z, -r1.w
mul r0.xyz, v5, r0
mad oT1.xy, r4.z, c13.zwzw, r4
mul oT3.w, -r0, r1.x
mul oD0.xyz, r0, c22.y
mad oT0.xy, v3, c19, c19.zwzw
mad oT2.xy, v4, c18, c18.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0
eefiecedmoajljkiikljdhehebioaplmlnbjcnkiabaaaaaagaakaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefckiaiaaaaeaaaabaackacaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaa
fjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaaeaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
aeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaa
aaaaaaaaafaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaaeaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
ccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaaakaabaaa
aaaaaaaadkiacaaaaeaaaaaaacaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaa
acaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakaabaaaabaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
BindCB  "UnityTerrain" 4
"vs_4_0_level_9_1
eefiecedoamcmpgmnjpjalbnehpnfkficfecaibeabaaaaaammapaaaaaeaaaaaa
daaaaaaajiafaaaaeiaoaaaabaapaaaaebgpgodjgaafaaaagaafaaaaaaacpopp
paaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaeaaaaaaadaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeafbaaaaafbfaaapkaekbfmneanlapejmagfiiaidmehamfaljfbaaaaaf
bgaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafbhaaapkafnjicmdp
hnbdikdohnbdakdodddddddpfbaaaaafbiaaapkakgjlmedmaknhcddnipmcpfln
kgjlmednfbaaaaafbjaaapkakgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaaf
bkaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaafblaaapkakgjleedm
aknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaafaaaaad
aaaaadiaaaaaoijabcaaffkaafaaaaadabaaapiaaaaaffiabgaajekaaeaaaaae
aaaaapiaaaaaaaiablaaoekaabaaoeiaabaaaaacabaaabiabcaaaakaaeaaaaae
aaaaapiaabaaaaiabeaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaae
aaaaapiaaaaaoeiabfaaaakabfaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiabgaappka
aaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeia
acaaoeiaaeaaaaaeaaaaapiaacaaoeiabfaakkkaaaaaoeiaaeaaaaaeaaaaapia
abaaoeiabfaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjabcaakkkaafaaaaad
abaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiabhaajakaafaaaaad
aaaaabiaaaaaaaiabhaappkaajaaaaadacaaabiaabaaoeiabiaaoekaajaaaaad
acaaaeiaabaaoeiabjaaoekaaeaaaaaeabaaafiaacaaoeiabcaakkkbaaaaoeja
abaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiabdaajakbaiaaaaad
aaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibbcaappkaafaaaaad
aaaaaciaaaaaffiabdaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaad
aaaaaciaaaaaffiabkaakkkaakaaaaadabaaaioaaaaaffiabkaappkaabaaaaac
acaaajiabkaaoekaacaaaaadaaaaaoiaacaaaaiabbaajakaaeaaaaaeaaaaahia
aaaaaaiaaaaapjiabkaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaad
abaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
afaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaabaaaaia
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaappjaaaaaoeiaafaaaaadadaaahiaaaaapeiabkaaffkaafaaaaad
adaaaiiaadaaffiaadaaaakaacaaaaadacaaadoaadaakkiaadaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadacaaahiaaaaaffjaaoaaoeka
aeaaaaaeacaaahiaanaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaapaaoeka
abaakkiaacaaoeiaaeaaaaaeacaaahiabaaaoekaaaaappjaacaaoeiaacaaaaad
acaaahiaacaaoeiaaeaaoekbafaaaaadadaaahoaacaaoeiaaeaappkaafaaaaad
abaaaciaaaaaffjaakaakkkaaeaaaaaeabaaabiaajaakkkaabaaaaiaabaaffia
aeaaaaaeabaaabiaalaakkkaabaakkiaabaaaaiaaeaaaaaeabaaabiaamaakkka
aaaappjaabaaaaiaacaaaaadabaaaciaacaappiaaeaappkbafaaaaadadaaaioa
abaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefckiaiaaaa
eaaaabaackacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaaeegiocaaa
adaaaaaabaaaaaaafjaaaaaeegiocaaaaeaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaai
dcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaaeaaaaaaabaaaaaadiaaaaak
pcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddm
mnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedm
aknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaa
agiacaaaaeaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjea
egaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaap
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmnea
ekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidm
egaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaa
ehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaa
afaaaaaackiacaaaaeaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdn
dcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaaeaaaaaa
abaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
acaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
afaaaaaakgiocaaaaaaaaaaaafaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaa
aeaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaam
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaaegiccaiaebaaaaaaaeaaaaaaacaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaadkiacaaaaeaaaaaaabaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaaakaabaaaaaaaaaaadkiacaaaaeaaaaaaacaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaa
agadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
acaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaa
adaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaa
akaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaagaaaaaackaabaaaabaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaa
aaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [unity_LightmapST]
Vector 10 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..10],
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
MUL R0.x, vertex.position.z, c[7].y;
MUL R1.xyz, R0.x, c[12];
MUL R0.x, vertex.position, c[7].y;
MAD R1, R0.x, c[11], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[12].w;
ADD R0, R0, -c[13].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[13].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[13].z, R0;
MAD R0, R1, c[13].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[7].z;
MUL R0, R1, R2.x;
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[15];
MAD R2.xz, -R3.xyyw, c[7].z, vertex.position;
DP4 R0.w, R2, c[4];
DP4 R0.z, R2, c[3];
DP4 R0.x, R2, c[1];
DP4 R0.y, R2, c[2];
MUL R3.xyz, R0.xyww, c[16].w;
MUL R3.y, R3, c[5].x;
ADD result.texcoord[1].xy, R3, R3.z;
ADD R3.xyz, R2, -c[8];
MOV result.position, R0;
DP3 R2.x, R3, R3;
ADD R0.x, -R2, c[7].w;
MUL R0.y, R0.x, c[8].w;
MOV result.texcoord[1].zw, R0;
MUL R2.x, R0.y, c[0].y;
MOV R0.x, c[16].w;
DP4 R0.w, R1, c[16].xxyz;
ADD R0.xyz, -R0.x, c[6];
MAD R0.xyz, R0.w, R0, c[16].w;
MIN R0.w, R2.x, c[17].x;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[17].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[9], c[9].zwzw;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [unity_LightmapST]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c12, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c13, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c14, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c15, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c16, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c17, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c18, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r0.x, v0.z, c7.y
mul r1.xyz, r0.x, c11
mul r0.x, v0, c7.y
mad r1, r0.x, c12, r1.xyyz
mov r0.x, c7
mad r0, c13, r0.x, r1
frc r0, r0
mad r0, r0, c14.x, c14.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c11.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c14.z, r0
mad r0, r1, c14.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c7.z
mul r0, r1, r2.x
dp4 r3.y, r0, c15
dp4 r3.x, r0, c16
mad r2.xz, -r3.xyyw, c7.z, v0
dp4 r0.w, r2, c3
dp4 r0.z, r2, c2
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
mul r3.xyz, r0.xyww, c18.x
mul r3.y, r3, c4.x
mad oT1.xy, r3.z, c5.zwzw, r3
add r3.xyz, r2, -c8
mov oPos, r0
dp3 r2.x, r3, r3
add r0.x, -r2, c7.w
mov oT1.zw, r0
mul r0.w, r0.x, c8
mul r2.x, r0.w, c13.y
mov r0.xyz, c6
dp4 r0.w, r1, c17.xxyz
add r0.xyz, c17.w, r0
mad r0.xyz, r0.w, r0, c18.x
min r0.w, r2.x, c18.y
mul r0.xyz, v5, r0
max oD0.w, r0, c18.z
mul oD0.xyz, r0, c13.y
mad oT0.xy, v3, c10, c10.zwzw
mad oT2.xy, v4, c9, c9.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjmddhgcgjnoakcmjajhfpbpgoplacidiabaaaaaaheaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcneagaaaa
eaaaabaalfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaacaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaa
aaaaaaaaagadbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaa
dgaaaaafmccabaaaadaaaaaakgaobaaaacaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecednkanhdnjpopapcmgnemkdofoglknonofabaaaaaapaamaaaaaeaaaaaa
daaaaaaakiaeaaaaiealaaaaemamaaaaebgpgodjhaaeaaaahaaeaaaaaaacpopp
biaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
adaaaaaaadaaaiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeafbaaaaafamaaapkaekbfmneanlapejmagfiiaidm
ehamfaljfbaaaaafanaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
aoaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafapaaapkakgjlmedm
aknhcddnipmcpflnkgjlmednfbaaaaafbaaaapkakgjlmedlaknhkddmaknhkdlm
mnmmmmdnfbaaaaafbbaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaaf
bcaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijaajaaffkaafaaaaadabaaapiaaaaaffia
anaajekaaeaaaaaeaaaaapiaaaaaaaiabcaaoekaabaaoeiaabaaaaacabaaabia
ajaaaakaaeaaaaaeaaaaapiaabaaaaiaalaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaamaaaakaamaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiaanaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiaamaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
ajaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
aoaajakaafaaaaadaaaaabiaaaaaaaiaaoaappkaajaaaaadacaaabiaabaaoeia
apaaoekaajaaaaadacaaaeiaabaaoeiabaaaoekaaeaaaaaeabaaafiaacaaoeia
ajaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
akaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
ajaappkaafaaaaadaaaaaciaaaaaffiaakaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiabbaakkkaakaaaaadabaaaioaaaaaffia
bbaappkaabaaaaacacaaabiabbaaaakaacaaaaadaaaaaoiaacaaaaiaaiaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiabbaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadabaaahoaaaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoeja
acaaoekaacaaookaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapia
aeaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeia
bbaaffkaafaaaaadabaaaiiaabaaffiaadaaaakaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiappppaaaafdeieefcneagaaaaeaaaabaalfabaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaacaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaa
afaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaa
acaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaa
aaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalp
aaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaacaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaa
acaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
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
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
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
Vector 5 [unity_LightShadowBias]
Vector 6 [_WavingTint]
Vector 7 [_WaveAndDistance]
Vector 8 [_CameraPosition]
Vector 9 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..9],
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
MUL R0.x, vertex.position.z, c[7].y;
MUL R1.xyz, R0.x, c[11];
MUL R0.x, vertex.position, c[7].y;
MAD R1, R0.x, c[10], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[7].x, R1;
FRC R0, R0;
MUL R0, R0, c[11].w;
ADD R0, R0, -c[12].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[12].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[12].z, R0;
MAD R0, R1, c[12].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[7].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[13];
DP4 R2.x, R0, c[14];
MAD R0.xz, -R2.xyyw, c[7].z, vertex.position;
MOV R0.yw, vertex.position;
DP4 R2.w, R0, c[4];
DP4 R2.x, R0, c[3];
ADD R2.x, R2, c[5];
MAX R2.y, R2.x, -R2.w;
ADD R2.y, R2, -R2.x;
MAD result.position.z, R2.y, c[5].y, R2.x;
ADD R2.xyz, R0, -c[8];
DP3 R2.x, R2, R2;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
ADD R2.x, -R2, c[7].w;
MUL R0.y, R2.x, c[8].w;
MUL R0.w, R0.y, c[0].y;
MOV R0.x, c[15].w;
MIN R0.w, R0, c[16].x;
ADD R0.xyz, -R0.x, c[6];
DP4 R1.x, R1, c[15].xxyz;
MAD R0.xyz, R1.x, R0, c[15].w;
MUL R0.xyz, vertex.color, R0;
MOV result.position.w, R2;
MAX result.color.w, R0, c[16].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[9], c[9].zwzw;
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [unity_LightShadowBias]
Vector 5 [_WavingTint]
Vector 6 [_WaveAndDistance]
Vector 7 [_CameraPosition]
Vector 8 [_MainTex_ST]
"vs_2_0
def c9, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c10, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c11, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c12, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c13, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c14, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c15, 0.00000000, 0.47193992, 0.18877596, 0.09438798
def c16, -0.50000000, 0.50000000, 1.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c6.y
mul r1.xyz, r0.x, c9
mul r0.x, v0, c6.y
mad r1, r0.x, c10, r1.xyyz
mov r0.x, c6
mad r0, c11, r0.x, r1
frc r0, r0
mad r0, r0, c12.x, c12.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c9.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c12.z, r0
mad r0, r1, c12.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r1, r0, r0
mul r2.x, v5.w, c6.z
mul r0, r1, r2.x
dp4 r3.y, r0, c13
dp4 r3.x, r0, c14
mad r2.xz, -r3.xyyw, c6.z, v0
dp4 r0.x, r2, c2
add r0.x, r0, c4
max r0.y, r0.x, c15.x
add r0.y, r0, -r0.x
mad r0.z, r0.y, c4.y, r0.x
add r3.xyz, r2, -c7
dp4 r0.w, r2, c3
dp4 r0.x, r2, c0
dp4 r0.y, r2, c1
dp3 r3.x, r3, r3
mov oPos, r0
mov oT0, r0
add r2.x, -r3, c6.w
mul r0.w, r2.x, c7
mul r2.x, r0.w, c11.y
mov r0.xyz, c5
dp4 r0.w, r1, c15.yyzw
add r0.xyz, c16.x, r0
mad r0.xyz, r0.w, r0, c16.y
min r0.w, r2.x, c16.z
mul r0.xyz, v5, r0
max oD0.w, r0, c15.x
mul oD0.xyz, r0, c11.y
mad oT1.xy, v3, c8, c8.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedhjifjhnbjfjbpcdcemioehhnnodeednnabaaaaaaoeahaaaaadaaaaaa
cmaaaaaapeaaaaaagiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaagfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcheagaaaaeaaaabaajnabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaa
fgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaa
agaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaa
abaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaa
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejma
nlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflo
lfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
gfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfalj
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaak
bcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdo
hnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddp
bbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddn
ipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaia
ebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaai
pcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaaiccaabaaaaaaaaaaa
ckaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadgaaaaaflccabaaaaaaaaaaa
egambaaaacaaaaaadeaaaaahecaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaaabaaaaaaafaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaa
abaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaabkaabaaaaaaaaaaa
dkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedinogpladjhjllkeagcjdodelppbieohaabaaaaaaeiamaaaaaeaaaaaa
daaaaaaajaaeaaaaamalaaaanealaaaaebgpgodjfiaeaaaafiaeaaaaaaacpopp
aaaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
adaaaaaaadaaahaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafakaaapkajkjjjjdp
aaaaaaeamnmmmmdpjkjjjjeafbaaaaafalaaapkaekbfmneanlapejmagfiiaidm
ehamfaljfbaaaaafamaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaaf
anaaapkafnjicmdphnbdikdohnbdakdodddddddpfbaaaaafaoaaapkakgjlmedm
aknhcddnipmcpflnkgjlmednfbaaaaafapaaapkakgjlmedlaknhkddmaknhkdlm
mnmmmmdnfbaaaaafbaaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadpfbaaaaaf
bbaaapkakgjleedmaknhkddmipmchfdnkgjlmedmbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaadia
aaaaoijaaiaaffkaafaaaaadabaaapiaaaaaffiaamaajekaaeaaaaaeaaaaapia
aaaaaaiabbaaoekaabaaoeiaabaaaaacabaaabiaaiaaaakaaeaaaaaeaaaaapia
abaaaaiaakaaoekaaaaaoeiabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiaalaaaakaalaaffkaafaaaaadabaaapiaaaaaoeiaaaaaoeiaafaaaaad
acaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapiaacaaoeiaamaappkaaaaaoeia
afaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeia
aeaaaaaeaaaaapiaacaaoeiaalaakkkaaaaaoeiaaeaaaaaeaaaaapiaabaaoeia
alaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadaaaaapia
aaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappjaaiaakkkaafaaaaadabaaapia
aaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeiaanaajakaafaaaaadaaaaabia
aaaaaaiaanaappkaajaaaaadacaaabiaabaaoeiaaoaaoekaajaaaaadacaaaeia
abaaoeiaapaaoekaaeaaaaaeabaaafiaacaaoeiaaiaakkkbaaaaoejaabaaaaac
abaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaiaajaajakbaiaaaaadaaaaacia
aaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffibaiaappkaafaaaaadaaaaacia
aaaaffiaajaappkaacaaaaadaaaaaciaaaaaffiaaaaaffiaalaaaaadaaaaacia
aaaaffiabaaakkkaakaaaaadabaaaioaaaaaffiabaaappkaabaaaaacacaaabia
baaaaakaacaaaaadaaaaaoiaacaaaaiaahaajakaaeaaaaaeaaaaahiaaaaaaaia
aaaapjiabaaaffkaacaaaaadaaaaahiaaaaaoeiaaaaaoeiaafaaaaadabaaahoa
aaaaoeiaafaaoejaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaabaaaaiaaaaaoeia
aeaaaaaeaaaaapiaafaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapiaagaaoeka
aaaappjaaaaaoeiaacaaaaadaaaaaeiaaaaakkiaacaaaakaalaaaaadabaaabia
aaaakkiabaaakkkaacaaaaadabaaabiaaaaakkibabaaaaiaaeaaaaaeaaaaaema
acaaffkaabaaaaiaaaaakkiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaaimaaaaappiappppaaaafdeieefcheagaaaaeaaaabaajnabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaaaeaaaaaafjaaaaaeegiocaaaadaaaaaaadaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaa
igbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaam
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdn
kgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaa
abaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaa
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaa
nlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaa
lfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
acaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfalj
ehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaa
adaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdp
fnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaa
kgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaa
abaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaa
abaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaa
aaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaaaaaaaaai
ccaabaaaaaaaaaaackaabaaaacaaaaaaakiacaaaabaaaaaaafaaaaaadgaaaaaf
lccabaaaaaaaaaaaegambaaaacaaaaaadeaaaaahecaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakeccabaaaaaaaaaaabkiacaaaabaaaaaa
afaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaacaaaaaa
bkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaagfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_LightPositionRange]
Vector 10 [_WavingTint]
Vector 11 [_WaveAndDistance]
Vector 12 [_CameraPosition]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.mvp,
		program.local[5..13],
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
MUL R0.x, vertex.position.z, c[11].y;
MUL R1.xyz, R0.x, c[15];
MUL R0.x, vertex.position, c[11].y;
MAD R1, R0.x, c[14], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[11].x, R1;
FRC R0, R0;
MUL R0, R0, c[15].w;
ADD R0, R0, -c[16].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[16].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[16].z, R0;
MAD R0, R1, c[16].y, R0;
MUL R0, R0, R0;
MUL R1, R0, R0;
MUL R2.x, vertex.color.w, c[11].z;
MUL R0, R1, R2.x;
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[18];
MAD R0.xz, -R2.xyyw, c[11].z, vertex.position;
MOV R0.yw, vertex.position;
DP4 R2.z, R0, c[7];
DP4 R2.x, R0, c[5];
DP4 R2.y, R0, c[6];
ADD result.texcoord[0].xyz, R2, -c[9];
ADD R2.xyz, R0, -c[12];
DP3 R2.x, R2, R2;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
ADD R2.x, -R2, c[11].w;
MUL R0.y, R2.x, c[12].w;
MUL R0.w, R0.y, c[0].y;
MOV R0.x, c[19].w;
MIN R0.w, R0, c[20].x;
ADD R0.xyz, -R0.x, c[10];
DP4 R1.x, R1, c[19].xxyz;
MAD R0.xyz, R1.x, R0, c[19].w;
MUL R0.xyz, vertex.color, R0;
MAX result.color.w, R0, c[20].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
END
# 46 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_LightPositionRange]
Vector 9 [_WavingTint]
Vector 10 [_WaveAndDistance]
Vector 11 [_CameraPosition]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c14, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c15, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c16, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c17, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c18, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c19, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c20, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c10.y
mul r1.xyz, r0.x, c13
mul r0.x, v0, c10.y
mad r1, r0.x, c14, r1.xyyz
mov r0.x, c10
mad r0, c15, r0.x, r1
frc r0, r0
mad r0, r0, c16.x, c16.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c13.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c16.z, r0
mad r0, r1, c16.w, r0
mul r0, r0, r0
mul r1, r0, r0
mul r2.x, v5.w, c10.z
mul r0, r1, r2.x
dp4 r2.y, r0, c17
dp4 r2.x, r0, c18
mad r0.xz, -r2.xyyw, c10.z, v0
mov r0.yw, v0
dp4 r2.z, r0, c6
dp4 r2.x, r0, c4
dp4 r2.y, r0, c5
add oT0.xyz, r2, -c8
add r2.xyz, r0, -c11
dp3 r2.x, r2, r2
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
add r2.x, -r2, c10.w
mul r0.w, r2.x, c11
mov r0.xyz, c9
mul r0.w, r0, c15.y
min r0.w, r0, c20.y
add r0.xyz, c19.w, r0
dp4 r1.x, r1, c19.xxyz
mad r0.xyz, r1.x, r0, c20.x
mul r0.xyz, v5, r0
max oD0.w, r0, c20.z
mul oD0.xyz, r0, c15.y
mad oT1.xy, v3, c12, c12.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedeioodnooiefkedjfibohjbpcigbniahpabaaaaaacmaiaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefckeagaaaaeaaaabaakjabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaa
aaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaa
aaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdndcaaaaampcaabaaa
aaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddmipmchfdnkgjlmedm
egaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaa
aceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmneaaceaaaaanlapejma
nlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflo
lfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfaljehamfaljehamfalj
ehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaa
abaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdp
hnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
dddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedm
aknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaa
agacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadiaaaaaiocaabaaa
aaaaaaaafgbfbaaaaaaaaaaaagijcaaaacaaaaaaanaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaacaaaaaaamaaaaaaagaabaaaabaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaafgaobaaaaaaaaaaaaaaaaaajhccabaaaabaaaaaajgahbaaa
aaaaaaaaegiccaiaebaaaaaaabaaaaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaaiiccabaaaadaaaaaa
bkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaa
agijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalp
dcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedceekogphlfhljakonhppnfnkgphppdmcabaaaaaaleamaaaaaeaaaaaa
daaaaaaaleaeaaaagaalaaaaciamaaaaebgpgodjhmaeaaaahmaeaaaaaaacpopp
biaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaabaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaadaaaaaaadaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafapaaapka
ekbfmneanlapejmagfiiaidmehamfaljfbaaaaafbaaaapkakgjlmedlaknhkddm
mnmmemdnlfhocflofbaaaaafbbaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafbcaaapkakgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafbdaaapka
kgjlmedlaknhkddmaknhkdlmmnmmmmdnfbaaaaafbeaaapkaaaaaaalpaaaaaadp
aaaaaaaaaaaaiadpfbaaaaafbfaaapkakgjleedmaknhkddmipmchfdnkgjlmedm
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijaamaaffkaafaaaaadabaaapiaaaaaffia
baaajekaaeaaaaaeaaaaapiaaaaaaaiabfaaoekaabaaoeiaabaaaaacabaaabia
amaaaakaaeaaaaaeaaaaapiaabaaaaiaaoaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaapaaaakaapaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiabaaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiaapaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiaapaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
amaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
bbaajakaafaaaaadaaaaabiaaaaaaaiabbaappkaajaaaaadacaaabiaabaaoeia
bcaaoekaajaaaaadacaaaeiaabaaoeiabdaaoekaaeaaaaaeabaaafiaacaaoeia
amaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
anaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
amaappkaafaaaaadaaaaaciaaaaaffiaanaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiabeaakkkaakaaaaadacaaaioaaaaaffia
beaappkaabaaaaacacaaabiabeaaaakaacaaaaadaaaaaoiaacaaaaiaalaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiabeaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadacaaahoaaaaaoeiaafaaoejaaeaaaaaeabaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahia
ahaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaahiaajaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaahiaakaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahoaaaaaoeia
acaaoekbafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoeka
abaaaaiaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaabaakkiaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefckeagaaaaeaaaabaa
kjabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
acaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaaadaaaaaa
adaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaac
adaaaaaadiaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaa
abaaaaaadiaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedl
aknhkddmaknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaakgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaan
pcaabaaaaaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaea
mnmmmmdpjkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmnea
ekbfmneaekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejma
diaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocflo
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidm
gfiiaidmgfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaa
abaaaaaaaceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaadkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaa
acaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmedn
bbaaaaakecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkdlmmnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaa
kgikcaaaadaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaa
acaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaafgbfbaaaaaaaaaaa
agijcaaaacaaaaaaanaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaa
agijcaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaafgaobaaaaaaaaaaadcaaaaak
ocaabaaaaaaaaaaaagijcaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaafgaobaaa
aaaaaaaaaaaaaaajhccabaaaabaaaaaajgahbaaaaaaaaaaaegiccaiaebaaaaaa
abaaaaaaabaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaa
bkbabaaaaaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaia
ebaaaaaaadaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaadaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadicaaaaiiccabaaaadaaaaaabkaabaaaaaaaaaaadkiacaaa
adaaaaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
aaaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
hnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
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
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[40] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
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
MUL R0.x, vertex.position.z, c[30].y;
MUL R1.xyz, R0.x, c[34];
MUL R0.x, vertex.position, c[30].y;
MAD R1, R0.x, c[33], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[30].x, R1;
FRC R0, R0;
MUL R0, R0, c[34].w;
ADD R0, R0, -c[35].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[35].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[35].z, R0;
MAD R0, R1, c[35].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R3, R0, R0;
MUL R1.x, vertex.color.w, c[30].z;
MUL R0, R3, R1.x;
DP4 R1.y, R0, c[36];
DP4 R1.x, R0, c[37];
MAD R2.xz, -R1.xyyw, c[30].z, vertex.position;
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
DP4 R0.w, R3, c[38].xxyz;
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
MOV R0.x, c[38].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[38].w;
MIN R0.w, R1.x, c[39].x;
MUL R0.xyz, vertex.color, R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[39].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 62 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c33, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c34, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c35, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c36, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c37, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c38, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c39, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c29.y
mul r1.xyz, r0.x, c32
mul r0.x, v0, c29.y
mad r1, r0.x, c33, r1.xyyz
mov r0.x, c29
mad r0, c34, r0.x, r1
frc r0, r0
mad r0, r0, c35.x, c35.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c32.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c35.z, r0
mad r0, r1, c35.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r3, r0, r0
mul r1.x, v5.w, c29.z
mul r0, r3, r1.x
dp4 r1.y, r0, c36
dp4 r1.x, r0, c37
mad r2.xz, -r1.xyyw, c29.z, v0
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
mul r1.x, r0.w, c34.y
dp4 r0.w, r3, c38.xxyz
add r0.xyz, c38.w, r0
mad r0.xyz, r0.w, r0, c39.x
min r0.w, r1.x, c39.y
mul r0.xyz, v5, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c39.z
mul oD0.xyz, r0, c34.y
mad oT5.xy, v3, c31, c31.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[40] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
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
MUL R0.x, vertex.position.z, c[30].y;
MUL R1.xyz, R0.x, c[34];
MUL R0.x, vertex.position, c[30].y;
MAD R1, R0.x, c[33], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[30].x, R1;
FRC R0, R0;
MUL R0, R0, c[34].w;
ADD R0, R0, -c[35].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[35].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[35].z, R0;
MAD R0, R1, c[35].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R3, R0, R0;
MUL R1.x, vertex.color.w, c[30].z;
MUL R0, R3, R1.x;
DP4 R1.y, R0, c[36];
DP4 R1.x, R0, c[37];
MAD R2.xz, -R1.xyyw, c[30].z, vertex.position;
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
DP4 R0.w, R3, c[38].xxyz;
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
MOV R0.x, c[38].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[38].w;
MIN R0.w, R1.x, c[39].x;
MUL R0.xyz, vertex.color, R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[39].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 62 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c33, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c34, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c35, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c36, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c37, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c38, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c39, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c29.y
mul r1.xyz, r0.x, c32
mul r0.x, v0, c29.y
mad r1, r0.x, c33, r1.xyyz
mov r0.x, c29
mad r0, c34, r0.x, r1
frc r0, r0
mad r0, r0, c35.x, c35.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c32.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c35.z, r0
mad r0, r1, c35.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r3, r0, r0
mul r1.x, v5.w, c29.z
mul r0, r3, r1.x
dp4 r1.y, r0, c36
dp4 r1.x, r0, c37
mad r2.xz, -r1.xyyw, c29.z, v0
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
mul r1.x, r0.w, c34.y
dp4 r0.w, r3, c38.xxyz
add r0.xyz, c38.w, r0
mad r0.xyz, r0.w, r0, c39.x
min r0.w, r1.x, c39.y
mul r0.xyz, v5, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c39.z
mul oD0.xyz, r0, c34.y
mad oT5.xy, v3, c31, c31.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjkciammjhldfalcbpjchbfmdjnlgbgccabaaaaaalmalaaaaadaaaaaa
cmaaaaaapeaaaaaaoaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcneajaaaaeaaaabaahfacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
gfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaajaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaaiaaaaaaagaabaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaakaaaaaa
kgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
abaaaaaaalaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaa
aaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaanaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaamaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaaoaaaaaakgakbaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaa
pgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaa
acaaaaaaagijcaaaabaaaaaabbaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabaaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaabcaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaa
abaaaaaabfaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabeaaaaaa
agaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabgaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkbabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaacaaaaaaaeaaaaaaakaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaak
ccaabaaaaaaaaaaackiacaaaacaaaaaaagaaaaaackaabaaaabaaaaaabkaabaaa
aaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaagiccabaaaafaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaa
aaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadicaaaaiiccabaaaahaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaa
acaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaah
hccabaaaahaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedjfeacmnmpiopobhhencmhombbpidlgijabaaaaaamibbaaaaaeaaaaaa
daaaaaaadiagaaaabebaaaaanmbaaaaaebgpgodjaaagaaaaaaagaaaaaaacpopp
jmafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaiaabaaaacaaaaaaaaaaacaaaaaaaiaabcaaaaaaaaaa
acaaamaaaeaabkaaaaaaaaaaadaaaaaaadaaboaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcbaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafccaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcdaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafceaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafcfaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafcgaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafchaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafciaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijabpaaffkaafaaaaadabaaapiaaaaaffia
cbaajekaaeaaaaaeaaaaapiaaaaaaaiacfaaoekaabaaoeiaabaaaaacabaaabia
bpaaaakaaeaaaaaeaaaaapiaabaaaaiaccaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaaakacdaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiacbaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiacdaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiacdaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
bpaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
ceaajakaafaaaaadaaaaabiaaaaaaaiaceaappkaajaaaaadacaaabiaabaaoeia
cgaaoekaajaaaaadacaaaeiaabaaoeiachaaoekaaeaaaaaeabaaafiaacaaoeia
bpaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
caaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
bpaappkaafaaaaadaaaaaciaaaaaffiacaaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiaciaakkkaakaaaaadagaaaioaaaaaffia
ciaappkaabaaaaacacaaabiaciaaaakaacaaaaadaaaaaoiaacaaaaiaboaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiaciaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadagaaahoaaaaaoeiaafaaoejaaeaaaaaeafaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaabiaaaaaffjabhaakkkaaeaaaaaeaaaaabia
bgaakkkaabaaaaiaaaaaaaiaaeaaaaaeaaaaabiabiaakkkaabaakkiaaaaaaaia
aeaaaaaeaaaaabiabjaakkkaaaaappjaaaaaaaiaabaaaaacaeaaaioaaaaaaaib
afaaaaadaaaaapiaaaaaffjablaaoekaaeaaaaaeaaaaapiabkaaoekaabaaaaia
aaaaoeiaaeaaaaaeaaaaapiabmaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapia
bnaaoekaaaaappjaaaaaoeiaafaaaaadacaaahiaaaaaffiaadaaoekaaeaaaaae
acaaahiaacaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaahiaaeaaoekaaaaakkia
acaaoeiaaeaaaaaeaaaaahoaafaaoekaaaaappiaacaaoeiaafaaaaadacaaahia
aaaaffiaahaaoekaaeaaaaaeacaaahiaagaaoekaaaaaaaiaacaaoeiaaeaaaaae
acaaahiaaiaaoekaaaaakkiaacaaoeiaaeaaaaaeabaaahoaajaaoekaaaaappia
acaaoeiaafaaaaadacaaahiaaaaaffiaalaaoekaaeaaaaaeacaaahiaakaaoeka
aaaaaaiaacaaoeiaaeaaaaaeacaaahiaamaaoekaaaaakkiaacaaoeiaaeaaaaae
acaaahoaanaaoekaaaaappiaacaaoeiaafaaaaadacaaahiaaaaaffiaapaaoeka
aeaaaaaeacaaahiaaoaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaahiabaaaoeka
aaaakkiaacaaoeiaaeaaaaaeadaaahoabbaaoekaaaaappiaacaaoeiaabaaaaac
aeaaahoaaaaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapia
bcaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcneajaaaa
eaaaabaahfacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaa
agaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaa
aaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
abaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
aaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
aaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaa
ckiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaa
agbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadiaaaaaiocaabaaa
aaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaajaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaaiaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaakaaaaaakgakbaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaabaaaaaaalaaaaaa
pgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaa
acaaaaaaagijcaaaabaaaaaaanaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaaamaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaaoaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaapgapbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaa
abaaaaaabbaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabaaaaaaa
agaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabcaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaabfaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabeaaaaaaagaabaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabgaaaaaa
kgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
abaaaaaabhaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaafhccabaaa
afaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaacaaaaaaafaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaacaaaaaa
aeaaaaaaakaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaacaaaaaaagaaaaaackaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaak
ccaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaa
aaaaaaaadgaaaaagiccabaaaafaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaal
dccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaaj
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
aaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaai
iccabaaaahaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaahaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
oeaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[40] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
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
MUL R0.x, vertex.position.z, c[30].y;
MUL R1.xyz, R0.x, c[34];
MUL R0.x, vertex.position, c[30].y;
MAD R1, R0.x, c[33], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[30].x, R1;
FRC R0, R0;
MUL R0, R0, c[34].w;
ADD R0, R0, -c[35].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[35].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[35].z, R0;
MAD R0, R1, c[35].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R3, R0, R0;
MUL R1.x, vertex.color.w, c[30].z;
MUL R0, R3, R1.x;
DP4 R1.y, R0, c[36];
DP4 R1.x, R0, c[37];
MAD R2.xz, -R1.xyyw, c[30].z, vertex.position;
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
DP4 R0.w, R3, c[38].xxyz;
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
MOV R0.x, c[38].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[38].w;
MIN R0.w, R1.x, c[39].x;
MUL R0.xyz, vertex.color, R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[39].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 62 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c33, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c34, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c35, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c36, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c37, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c38, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c39, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c29.y
mul r1.xyz, r0.x, c32
mul r0.x, v0, c29.y
mad r1, r0.x, c33, r1.xyyz
mov r0.x, c29
mad r0, c34, r0.x, r1
frc r0, r0
mad r0, r0, c35.x, c35.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c32.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c35.z, r0
mad r0, r1, c35.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r3, r0, r0
mul r1.x, v5.w, c29.z
mul r0, r3, r1.x
dp4 r1.y, r0, c36
dp4 r1.x, r0, c37
mad r2.xz, -r1.xyyw, c29.z, v0
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
mul r1.x, r0.w, c34.y
dp4 r0.w, r3, c38.xxyz
add r0.xyz, c38.w, r0
mad r0.xyz, r0.w, r0, c39.x
min r0.w, r1.x, c39.y
mul r0.xyz, v5, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c39.z
mul oD0.xyz, r0, c34.y
mad oT5.xy, v3, c31, c31.zwzw
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_WavingTint]
Vector 30 [_WaveAndDistance]
Vector 31 [_CameraPosition]
Vector 32 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[40] = { { 1.2, 2, 1.6, 4.8000002 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
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
MUL R0.x, vertex.position.z, c[30].y;
MUL R1.xyz, R0.x, c[34];
MUL R0.x, vertex.position, c[30].y;
MAD R1, R0.x, c[33], R1.xyyz;
MOV R0, c[0];
MAD R0, R0, c[30].x, R1;
FRC R0, R0;
MUL R0, R0, c[34].w;
ADD R0, R0, -c[35].x;
MUL R1, R0, R0;
MUL R2, R1, R0;
MAD R0, R2, c[35].w, R0;
MUL R2, R2, R1;
MUL R1, R2, R1;
MAD R0, R2, c[35].z, R0;
MAD R0, R1, c[35].y, R0;
MUL R0, R0, R0;
MOV R2.yw, vertex.position;
MUL R3, R0, R0;
MUL R1.x, vertex.color.w, c[30].z;
MUL R0, R3, R1.x;
DP4 R1.y, R0, c[36];
DP4 R1.x, R0, c[37];
MAD R2.xz, -R1.xyyw, c[30].z, vertex.position;
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
DP4 R0.w, R3, c[38].xxyz;
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
MOV R0.x, c[38].w;
ADD R0.xyz, -R0.x, c[29];
MAD R0.xyz, R0.w, R0, c[38].w;
MIN R0.w, R1.x, c[39].x;
MUL R0.xyz, vertex.color, R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
MAX result.color.w, R0, c[39].y;
MUL result.color.xyz, R0, c[0].y;
MAD result.texcoord[5].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 62 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 0.00600000, 0.02000000, 0.05000000, -0.16161616
def c33, 0.01200000, 0.02000000, 0.06000000, 0.02400000
def c34, 1.20000005, 2.00000000, 1.60000002, 4.80000019
def c35, 6.40884876, -3.14159274, 0.00833330, -0.00019841
def c36, 0.00600000, 0.02000000, -0.02000000, 0.10000000
def c37, 0.02400000, 0.04000000, -0.12000000, 0.09600000
def c38, 0.47193992, 0.18877596, 0.09438798, -0.50000000
def c39, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_color0 v5
mul r0.x, v0.z, c29.y
mul r1.xyz, r0.x, c32
mul r0.x, v0, c29.y
mad r1, r0.x, c33, r1.xyyz
mov r0.x, c29
mad r0, c34, r0.x, r1
frc r0, r0
mad r0, r0, c35.x, c35.y
mul r1, r0, r0
mul r2, r1, r0
mad r0, r2, c32.w, r0
mul r2, r2, r1
mul r1, r2, r1
mad r0, r2, c35.z, r0
mad r0, r1, c35.w, r0
mul r0, r0, r0
mov r2.yw, v0
mul r3, r0, r0
mul r1.x, v5.w, c29.z
mul r0, r3, r1.x
dp4 r1.y, r0, c36
dp4 r1.x, r0, c37
mad r2.xz, -r1.xyyw, c29.z, v0
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
mul r1.x, r0.w, c34.y
dp4 r0.w, r3, c38.xxyz
add r0.xyz, c38.w, r0
mad r0.xyz, r0.w, r0, c39.x
min r0.w, r1.x, c39.y
mul r0.xyz, v5, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
max oD0.w, r0, c39.z
mul oD0.xyz, r0, c34.y
mad oT5.xy, v3, c31, c31.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0
eefiecedjkciammjhldfalcbpjchbfmdjnlgbgccabaaaaaalmalaaaaadaaaaaa
cmaaaaaapeaaaaaaoaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooeaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcneajaaaaeaaaabaahfacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fjaaaaaeegiocaaaadaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
gfaaaaaddccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacadaaaaaa
diaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaa
diaaaaakpcaabaaaabaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddm
aknhkddmmnmmemdndcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaa
kgjleedmaknhkddmipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaa
aaaaaaaaagiacaaaadaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdp
jkjjjjeaegaobaaaaaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmnea
ekbfmneaekbfmneaaceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaah
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaam
pcaabaaaaaaaaaaaegaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidm
gfiiaidmegaobaaaaaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaaehamfaljehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaa
dkbabaaaafaaaaaackiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaafnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaak
ecaabaaaacaaaaaaegaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlm
mnmmmmdndcaaaaalfcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaa
adaaaaaaabaaaaaaagbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaacaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaa
acaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaajaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaaiaaaaaaagaabaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaakaaaaaa
kgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaa
abaaaaaaalaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaa
aaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaanaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaamaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaaoaaaaaakgakbaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaa
pgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaa
acaaaaaaagijcaaaabaaaaaabbaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabaaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaabcaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaa
abaaaaaabfaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabeaaaaaa
agaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabgaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaabhaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaa
dgaaaaafhccabaaaafaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkbabaaaaaaaaaaackiacaaaacaaaaaaafaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaacaaaaaaaeaaaaaaakaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaak
ccaabaaaaaaaaaaackiacaaaacaaaaaaagaaaaaackaabaaaabaaaaaabkaabaaa
aaaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaa
aaaaaaaabkaabaaaaaaaaaaadgaaaaagiccabaaaafaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaaldccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaa
aaaaaaaaaaaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaa
adaaaaaaacaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
adaaaaaaabaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadicaaaaiiccabaaaahaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaa
acaaaaaaaaaaaaalocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaalpaaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaah
hccabaaaahaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
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
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityTerrain" 3
"vs_4_0_level_9_1
eefiecedjfeacmnmpiopobhhencmhombbpidlgijabaaaaaamibbaaaaaeaaaaaa
daaaaaaadiagaaaabebaaaaanmbaaaaaebgpgodjaaagaaaaaaagaaaaaaacpopp
jmafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaiaabaaaacaaaaaaaaaaacaaaaaaaiaabcaaaaaaaaaa
acaaamaaaeaabkaaaaaaaaaaadaaaaaaadaaboaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcbaaapkakgjlmedlaknhkddmmnmmemdnlfhocflofbaaaaafccaaapka
jkjjjjdpaaaaaaeamnmmmmdpjkjjjjeafbaaaaafcdaaapkaekbfmneanlapejma
gfiiaidmehamfaljfbaaaaafceaaapkafnjicmdphnbdikdohnbdakdodddddddp
fbaaaaafcfaaapkakgjleedmaknhkddmipmchfdnkgjlmedmfbaaaaafcgaaapka
kgjlmedmaknhcddnipmcpflnkgjlmednfbaaaaafchaaapkakgjlmedlaknhkddm
aknhkdlmmnmmmmdnfbaaaaafciaaapkaaaaaaalpaaaaaadpaaaaaaaaaaaaiadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaafaaaaadaaaaadiaaaaaoijabpaaffkaafaaaaadabaaapiaaaaaffia
cbaajekaaeaaaaaeaaaaapiaaaaaaaiacfaaoekaabaaoeiaabaaaaacabaaabia
bpaaaakaaeaaaaaeaaaaapiaabaaaaiaccaaoekaaaaaoeiabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaaakacdaaffkaafaaaaadabaaapia
aaaaoeiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
acaaoeiacbaappkaaaaaoeiaafaaaaadacaaapiaabaaoeiaacaaoeiaafaaaaad
abaaapiaabaaoeiaacaaoeiaaeaaaaaeaaaaapiaacaaoeiacdaakkkaaaaaoeia
aeaaaaaeaaaaapiaabaaoeiacdaappkaaaaaoeiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaafaaaaadabaaabiaafaappja
bpaakkkaafaaaaadabaaapiaaaaaoeiaabaaaaiaajaaaaadaaaaabiaaaaaoeia
ceaajakaafaaaaadaaaaabiaaaaaaaiaceaappkaajaaaaadacaaabiaabaaoeia
cgaaoekaajaaaaadacaaaeiaabaaoeiachaaoekaaeaaaaaeabaaafiaacaaoeia
bpaakkkbaaaaoejaabaaaaacabaaaciaaaaaffjaacaaaaadaaaaaoiaabaajaia
caaajakbaiaaaaadaaaaaciaaaaapjiaaaaapjiaacaaaaadaaaaaciaaaaaffib
bpaappkaafaaaaadaaaaaciaaaaaffiacaaappkaacaaaaadaaaaaciaaaaaffia
aaaaffiaalaaaaadaaaaaciaaaaaffiaciaakkkaakaaaaadagaaaioaaaaaffia
ciaappkaabaaaaacacaaabiaciaaaakaacaaaaadaaaaaoiaacaaaaiaboaajaka
aeaaaaaeaaaaahiaaaaaaaiaaaaapjiaciaaffkaacaaaaadaaaaahiaaaaaoeia
aaaaoeiaafaaaaadagaaahoaaaaaoeiaafaaoejaaeaaaaaeafaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaabiaaaaaffjabhaakkkaaeaaaaaeaaaaabia
bgaakkkaabaaaaiaaaaaaaiaaeaaaaaeaaaaabiabiaakkkaabaakkiaaaaaaaia
aeaaaaaeaaaaabiabjaakkkaaaaappjaaaaaaaiaabaaaaacaeaaaioaaaaaaaib
afaaaaadaaaaapiaaaaaffjablaaoekaaeaaaaaeaaaaapiabkaaoekaabaaaaia
aaaaoeiaaeaaaaaeaaaaapiabmaaoekaabaakkiaaaaaoeiaaeaaaaaeaaaaapia
bnaaoekaaaaappjaaaaaoeiaafaaaaadacaaahiaaaaaffiaadaaoekaaeaaaaae
acaaahiaacaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaahiaaeaaoekaaaaakkia
acaaoeiaaeaaaaaeaaaaahoaafaaoekaaaaappiaacaaoeiaafaaaaadacaaahia
aaaaffiaahaaoekaaeaaaaaeacaaahiaagaaoekaaaaaaaiaacaaoeiaaeaaaaae
acaaahiaaiaaoekaaaaakkiaacaaoeiaaeaaaaaeabaaahoaajaaoekaaaaappia
acaaoeiaafaaaaadacaaahiaaaaaffiaalaaoekaaeaaaaaeacaaahiaakaaoeka
aaaaaaiaacaaoeiaaeaaaaaeacaaahiaamaaoekaaaaakkiaacaaoeiaaeaaaaae
acaaahoaanaaoekaaaaappiaacaaoeiaafaaaaadacaaahiaaaaaffiaapaaoeka
aeaaaaaeacaaahiaaoaaoekaaaaaaaiaacaaoeiaaeaaaaaeacaaahiabaaaoeka
aaaakkiaacaaoeiaaeaaaaaeadaaahoabbaaoekaaaaappiaacaaoeiaabaaaaac
aeaaahoaaaaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapia
bcaaoekaabaaaaiaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaabaakkiaaaaaoeia
aeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcneajaaaa
eaaaabaahfacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaabiaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafjaaaaaeegiocaaa
adaaaaaaadaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaaddccabaaa
agaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaacadaaaaaadiaaaaaidcaabaaa
aaaaaaaaigbabaaaaaaaaaaafgifcaaaadaaaaaaabaaaaaadiaaaaakpcaabaaa
abaaaaaafgafbaaaaaaaaaaaaceaaaaakgjlmedlaknhkddmaknhkddmmnmmemdn
dcaaaaampcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaakgjleedmaknhkddm
ipmchfdnkgjlmedmegaobaaaabaaaaaadcaaaaanpcaabaaaaaaaaaaaagiacaaa
adaaaaaaabaaaaaaaceaaaaajkjjjjdpaaaaaaeamnmmmmdpjkjjjjeaegaobaaa
aaaaaaaabkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaekbfmneaekbfmneaekbfmneaekbfmnea
aceaaaaanlapejmanlapejmanlapejmanlapejmadiaaaaahpcaabaaaabaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaacaaaaaa
aceaaaaalfhocflolfhocflolfhocflolfhocfloegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaampcaabaaaaaaaaaaa
egaobaaaacaaaaaaaceaaaaagfiiaidmgfiiaidmgfiiaidmgfiiaidmegaobaaa
aaaaaaaadcaaaaampcaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaehamfalj
ehamfaljehamfaljehamfaljegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaibcaabaaaabaaaaaadkbabaaaafaaaaaa
ckiacaaaadaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaabbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
fnjicmdpfnjicmdphnbdikdohnbdakdodiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaadddddddpbbaaaaakbcaabaaaacaaaaaaegaobaaaabaaaaaa
aceaaaaakgjlmedmaknhcddnipmcpflnkgjlmednbbaaaaakecaabaaaacaaaaaa
egaobaaaabaaaaaaaceaaaaakgjlmedlaknhkddmaknhkdlmmnmmmmdndcaaaaal
fcaabaaaabaaaaaaagacbaiaebaaaaaaacaaaaaakgikcaaaadaaaaaaabaaaaaa
agbcbaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaa
diaaaaaipcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaamaaaaaaagaabaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpcaabaaaacaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaacaaaaaadiaaaaaiocaabaaa
aaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaaajaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaaiaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaaakaaaaaakgakbaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaabaaaaaaalaaaaaa
pgapbaaaacaaaaaajgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaa
acaaaaaaagijcaaaabaaaaaaanaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaaamaaaaaaagaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaabaaaaaaaoaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaapgapbaaaacaaaaaa
jgahbaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaa
abaaaaaabbaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabaaaaaaa
agaabaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaa
abaaaaaabcaaaaaakgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaabaaaaaabdaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaafgafbaaaacaaaaaaagijcaaaabaaaaaabfaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabeaaaaaaagaabaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaabaaaaaabgaaaaaa
kgakbaaaacaaaaaafgaobaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
abaaaaaabhaaaaaapgapbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaafhccabaaa
afaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaacaaaaaaafaaaaaadcaaaaakccaabaaaaaaaaaaackiacaaaacaaaaaa
aeaaaaaaakaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaa
ckiacaaaacaaaaaaagaaaaaackaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaak
ccaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaabkaabaaa
aaaaaaaadgaaaaagiccabaaaafaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaal
dccabaaaagaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadgaaaaafccaabaaaabaaaaaabkbabaaaaaaaaaaaaaaaaaaj
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaiaebaaaaaaadaaaaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaadaaaaaaabaaaaaa
aaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadicaaaai
iccabaaaahaaaaaabkaabaaaaaaaaaaadkiacaaaadaaaaaaacaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagijcaaaadaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaalp
aaaaaalpaaaaaalpdcaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaaaaaaahhccabaaaahaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
oeaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaneaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaneaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaneaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaadamaaaannaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
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
 LOD 200
 Tags { "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
 Pass {
  Tags { "LIGHTMODE"="Vertex" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
  Lighting On
  Material {
   Ambient (1,1,1,1)
   Diffuse (1,1,1,1)
  }
  Cull Off
  AlphaTest Greater [_Cutoff]
  ColorMask RGB
  ColorMaterial AmbientAndDiffuse
  SetTexture [_MainTex] { combine texture * primary double, texture alpha }
 }
 Pass {
  Tags { "LIGHTMODE"="VertexLMRGBM" "QUEUE"="Geometry+200" "IGNOREPROJECTOR"="true" "RenderType"="Grass" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "texcoord1", TexCoord0
   Bind "texcoord", TexCoord1
  }
  Cull Off
  AlphaTest Greater [_Cutoff]
  ColorMask RGB
  SetTexture [unity_Lightmap] { Matrix [unity_LightmapMatrix] combine texture * texture alpha double }
  SetTexture [_MainTex] { combine texture * previous quad, texture alpha }
 }
}
Fallback Off
}