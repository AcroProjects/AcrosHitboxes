# Acro's Hitboxes

Acro’s Hitboxes aim to streamline the process of generating knockback and damage from collision.  This addon provides custom nodes that allow the user to apply knockback and damage to an object by changing the trajectory and strength of the knockback, allowing the user to visually see the launch angle and strength to reduce the amount of trial and error from traditional knockback methods, modify the length, width, and color of the hitbox, as well as enabling and disabling the hitbox.

# Installation

Copy `addons/acro_hitboxes` into your project (final path should be `res://addons/acro_hitboxes`). Open the Godot Editor, go to **Project Settings > Plugins** and enable the **Acro's Hitbox** plugin and click **Update**. You can now add a **Hitbox** node to a scene.

# Variables

## launch_angle (int)
This variable will determine where an object will be launched if it is in contact with the hitbox

## strength (int)
This variable will determine how far an object will be launch, which is properly shown in the editor with how long the launch angle line is

## damage (int)
This variable can be used to return the amount of damage an object will take if it gets hit by a certain attack

## knockback_scale (float, 0,1)
This variable returns a float from 0 to 1 and is only used for advance calculations, such as if the user wants the amount of knockback an object to receive based on the amount of damage it has already taken

## scale_x (int)
This variable can affects the width of the hitbox

## scale_y (int)
This variable can affects the height of the hitbox

## disabled (bool)
This variable works like the collisionshape2d button does (enables and disables the collision)

## reversed (bool)
This variable inverts the launch angle on its X-Axis when it's set to true

## lineThickness (int)
This variable changes the width of the launch angle line to make it easier for the user to see (for debugging purposes)

## draw_line_in_game (bool)
This variable can enable the launch angle line to be drawn when the game is running (for debugging purposes)

## hitbox_color (Color, RGBA)
This variable can change the color of the hitbox.  Keep in mind, if the color of the hitbox is oddly colored, you’ll have to go into your project settings and change the Collision Shape Color to white

# Methods

## get_launch_vector (int angle, int strength)
Calculates the launch vector to apply knockback
Parameters:
 - **angle**: launch_angle
 - **strength**: length and width of the vector
Returns:
 - Vector to apply knockback


# Support the project development
<a href="https://ko-fi.com/acroprojectss" target="_blank"><img height="137" width="250" src="https://cdn.ko-fi.com/cdn/useruploads/e26b0e38-3146-41f0-aa23-7f522973b5c0.png" alt="Donate On Kofi" width="150" ></a>
<br>

# License

 - This is currently under the MIT, however, I (Austin Molina) have the legal right to change/modify the license if I conclude that the MIT License for **Acro's Hitboxes** is being abused by potentially harmful projects (Examples: Games that target a certain group of people, games that are political properganda, Games that use NFTs or any other high energy used cyrto-tech, etc).

MIT License

Copyright (c) [2022] [Austin Molina]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
