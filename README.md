#  Godot 4 - Top-Down Movement & Dash Coroutines

## Overview
A complete 8-way movement controller designed for top-down 2D games (like RPGs or twin-stick shooters). This project specifically highlights Vector math logic and asynchronous GDScript timers to create a functional "Dash" mechanic.

## Core Mechanics & Implementation
*   **Vector Normalization:** When moving diagonally, raw input vectors can exceed a length of `1.0`, resulting in the player moving faster diagonally than horizontally. This controller uses `direction.normalized()` to mathematically restrict maximum speed across all angles.
*   **Analog Support:** Using `Input.get_vector()` natively supports gamepad analog sticks, providing smooth 360-degree movement data out of the box.
*   **Asynchronous Timers:** Instead of cluttering the physics loop with frame-counters, the dash mechanic relies on `await get_tree().create_timer().timeout`. This serves as an efficient GDScript Coroutine to temporarily boost speed and reset it asynchronously.

## Technical Highlights
The state-tracking variable `is_dashing` acts as a lightweight guard clause to prevent players from spamming the dash input before the timer resolves.

```gdscript
# Asynchronous Dash Logic
func start_dash():
	is_dashing = true
	current_speed = BASE_SPEED * DASH_MULTIPLIER
	await get_tree().create_timer(0.2).timeout 
	current_speed = BASE_SPEED
	is_dashing = false

<img width="2816" height="1351" alt="image(1)" src="https://github.com/user-attachments/assets/8c14b2d2-4a1d-4580-81b1-80cfcc3caeb5" />
