Shader "Hidden/TerrainEngine/BillboardTree" {
Properties {
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent-100" "IGNOREPROJECTOR"="true" "RenderType"="TreeBillboard" }
 Pass {
  Tags { "QUEUE"="Transparent-100" "IGNOREPROJECTOR"="true" "RenderType"="TreeBillboard" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_TreeBillboardCameraRight]
Vector 6 [_TreeBillboardCameraUp]
Vector 7 [_TreeBillboardCameraFront]
Vector 8 [_TreeBillboardCameraPos]
Vector 9 [_TreeBillboardDistances]
"!!ARBvp1.0
PARAM c[10] = { { 0 },
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
TEMP R1;
ADD R0.xyz, vertex.position, -c[8];
DP3 R0.x, R0, R0;
SLT R0.x, c[9], R0;
MAD R0.z, R0.x, -vertex.texcoord[0].y, vertex.texcoord[0].y;
MAD R0.xy, -vertex.texcoord[1], R0.x, vertex.texcoord[1];
ADD R0.z, -R0.y, R0;
MAD R1.xyz, R0.x, c[5], vertex.position;
MAD R0.y, R0.z, c[8].w, R0;
MOV R0.w, vertex.position;
MAD R1.xyz, R0.y, c[6], R1;
ABS R0.x, R0;
MUL R0.xyz, R0.x, c[7];
MAD R0.xyz, R0, c[6].w, R1;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV result.color, vertex.color;
SLT result.texcoord[0].y, c[0].x, vertex.texcoord[0];
MOV result.texcoord[0].x, vertex.texcoord[0];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_TreeBillboardCameraRight]
Vector 5 [_TreeBillboardCameraUp]
Vector 6 [_TreeBillboardCameraFront]
Vector 7 [_TreeBillboardCameraPos]
Vector 8 [_TreeBillboardDistances]
"vs_2_0
def c9, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_color0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
add r0.xyz, v0, -c7
dp3 r0.x, r0, r0
slt r0.x, c8, r0
max r0.x, -r0, r0
slt r0.x, c9, r0
add r0.z, -r0.x, c9.y
mul r0.xy, r0.z, v3
mad r0.z, r0, v2.y, -r0.y
mad r1.xyz, r0.x, c4, v0
mad r0.y, r0.z, c7.w, r0
mov r0.w, v0
mad r1.xyz, r0.y, c5, r1
abs r0.x, r0
mul r0.xyz, r0.x, c6
mad r0.xyz, r0, c5.w, r1
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v1
slt oT0.y, c9.x, v2
mov oT0.x, v2
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 180 [_TreeBillboardCameraRight] 3
Vector 192 [_TreeBillboardCameraUp]
Vector 208 [_TreeBillboardCameraFront]
Vector 224 [_TreeBillboardCameraPos]
Vector 240 [_TreeBillboardDistances]
BindCB  "UnityPerDraw" 0
BindCB  "UnityTerrain" 1
"vs_4_0
eefiecedkflfnamiepkhkjabcpbmipennolnjfccabaaaaaafaaeaaaaadaaaaaa
cmaaaaaaleaaaaaaciabaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaahhaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaahhaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaedepemepfcaafeeffiedepepfceeaaepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagcaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaaedepemepfcaafeef
fiedepepfceeaaklfdeieefccaadaaaaeaaaabaamiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegbcbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaaaoaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaa
aaaaaaaaakiacaaaabaaaaaaapaaaaaaakaabaaaaaaaaaaadgaaaaafdcaabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaafecaabaaaabaaaaaabkbabaaaacaaaaaa
dhaaaaamhcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaiecaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaa
abaaaaaaaoaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaajgihcaaaabaaaaaaalaaaaaaagaabaaaaaaaaaaaegbcbaaaaaaaaaaa
diaaaaajncaabaaaaaaaaaaaagaabaiaibaaaaaaaaaaaaaaagijcaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaamaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
pgipcaaaabaaaaaaamaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaabaaaaaa
dbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaabkbabaaaacaaaaaaabaaaaah
cccabaaaacaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaafbccabaaa
acaaaaaaakbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
ConstBuffer "UnityTerrain" 256
Vector 180 [_TreeBillboardCameraRight] 3
Vector 192 [_TreeBillboardCameraUp]
Vector 208 [_TreeBillboardCameraFront]
Vector 224 [_TreeBillboardCameraPos]
Vector 240 [_TreeBillboardDistances]
BindCB  "UnityPerDraw" 0
BindCB  "UnityTerrain" 1
"vs_4_0_level_9_1
eefieceddmngpmjpkddajlnggdbibbiiadfipelpabaaaaaaeiagaaaaaeaaaaaa
daaaaaaaceacaaaaemafaaaaneafaaaaebgpgodjomabaaaaomabaaaaaaacpopp
kmabaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaaaaa
aeaaabaaaaaaaaaaabaaalaaafaaafaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaaf
akaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaamaaaaadabaaacoaakaaaakaacaaffjaacaaaaadaaaaahiaaaaaoeja
aiaaoekbaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaamaaaaadaaaaabiaajaaaaka
aaaaaaiaabaaaaacabaaadiaadaaoejaabaaaaacabaaaeiaacaaffjaaeaaaaae
aaaaahiaaaaaaaiaabaaoeibabaaoeiaaeaaaaaeabaaahiaafaapjkaaaaaaaia
aaaaoejabcaaaaaeabaaaiiaaiaappkaaaaakkiaaaaaffiacdaaaaacaaaaabia
aaaaaaiaafaaaaadaaaaahiaaaaaaaiaahaaoekaaeaaaaaeabaaahiaagaaoeka
abaappiaabaaoeiaaeaaaaaeaaaaahiaaaaaoeiaagaappkaabaaoeiaafaaaaad
abaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaaeaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaapoaabaaoejaabaaaaacabaaaboaacaaaaja
ppppaaaafdeieefccaadaaaaeaaaabaamiaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egbcbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaaaoaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadbaaaaaibcaabaaaaaaaaaaa
akiacaaaabaaaaaaapaaaaaaakaabaaaaaaaaaaadgaaaaafdcaabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaafecaabaaaabaaaaaabkbabaaaacaaaaaadhaaaaam
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaabaaaaaa
aoaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
jgihcaaaabaaaaaaalaaaaaaagaabaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaj
ncaabaaaaaaaaaaaagaabaiaibaaaaaaaaaaaaaaagijcaaaabaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaamaaaaaafgafbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaigadbaaaaaaaaaaapgipcaaa
abaaaaaaamaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaaaaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaabaaaaaadbaaaaah
bcaabaaaaaaaaaaaabeaaaaaaaaaaaaabkbabaaaacaaaaaaabaaaaahcccabaaa
acaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaafbccabaaaacaaaaaa
akbabaaaacaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaahhaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaahhaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaedepemepfcaafeeffiedepepfceeaaepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagcaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaaedepemepfcaafeef
fiedepepfceeaakl"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[1] = { { 0 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
SLT R1.x, R0.w, c[0];
MUL result.color.xyz, R0, fragment.color.primary;
MOV result.color.w, R0;
KIL -R1.x;
END
# 5 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c0, 0.00000000, 1.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
texld r0, t0, s0
cmp r1.x, r0.w, c0, c0.y
mov_pp r1, -r1.x
mul_pp r0.xyz, r0, v0
mov_pp oC0, r0
texkill r1.xyzw
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefieceddnobajecojmndopcoahmhecpcgmdlobjabaaaaaakmabaaaaadaaaaaa
cmaaaaaakaaaaaaaneaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapahaaaagcaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaaedepemepfcaafeeffiedepepfceeaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcnaaaaaaaeaaaaaaa
deaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaabaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedenfcbkfiindpppikcjjlokfnieolleihabaaaaaaemacaaaaaeaaaaaa
daaaaaaammaaaaaakeabaaaabiacaaaaebgpgodjjeaaaaaajeaaaaaaaaacpppp
gmaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaacpiaabaaoelaaaaioekaabaaaaacabaacpia
aaaappiaebaaaaababaaapiaafaaaaadabaachiaaaaaoeiaaaaaoelaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefcnaaaaaaaeaaaaaaadeaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadbaaaaahbcaabaaaabaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
doaaaaabejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apahaaaagcaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafdfgfpfa
epfdejfeejepeoaaedepemepfcaafeeffiedepepfceeaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback Off
}