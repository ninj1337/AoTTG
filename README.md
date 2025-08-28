# AoTTG

## About

A very basic reconstruction of the final (non-beta) version of the original AoTTG game by Feng Li (v01042015).

The goal is to create a build-able Unity project that produces a 1:1 copy of the original game. It only contains resources contained in the release build of the game, and no effort has been made to restore the original Unity project itself (i.e. restoring references to used packages).

## Building

Open the project folder in Unity 4.6.0f3 and build.

### Issues with the weapon trail shader

You will need a Pro license for the weapon trail shader (`xft_displacement_screen.shader`) to build correctly, as it uses GrabPass which requires RenderTexture support. I have left the original fallback SubShader unmodified to remain 1:1, but if you are building without a Pro license I encourage you to modify the fallback so it doesn't look so horrible.

## Credits

Per the in-game credits page:

```text
遊戲製作：李丰
動作師：李江
The game was inspired by the anime/manga: Shingeki no kyojin (or Attack On Titan)
Created by: Feng Li
Addtional Animator: Jiang Li
Special Thanks: Aya
```
