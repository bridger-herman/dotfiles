// Copyright 2023 Danny Nguyen (danny@keeb.io)
// SPDX-License-Identifier: GPL-2.0-or-later

#include QMK_KEYBOARD_H
#include "print.h"

enum custom_keycodes {
    // Macros
    MC_CLOS = SAFE_RANGE // keep enum to safe outside QMK's ranges
};

// The main keymaps/layers
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_80_with_macro(
    KC_ESC ,                  KC_ESC,   KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,               KC_F7,   KC_F8,     KC_F9,   KC_F10,   KC_F11,  KC_F12,  KC_INS,  KC_MUTE,
    _______,   _______,       KC_GRV,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,                KC_7,    KC_8,      KC_9,     KC_0,  KC_MINS,  KC_EQL, XXXXXXX,  KC_BSPC, KC_DEL,
    KC_PSCR,   KC_PGUP,       KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                KC_Y,    KC_U,    KC_I,      KC_O,     KC_P,  KC_LBRC, KC_RBRC, KC_BSLS,  _______,
    _______,   KC_PGDN,      KC_CAPS,    KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                KC_H,    KC_J,    KC_K,      KC_L,  KC_SCLN,  KC_QUOT,           KC_ENT,  KC_HOME,
    _______,   _______,      KC_LSFT,             KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                KC_N,    KC_M,   KC_COMM,   KC_DOT,  KC_SLSH, KC_RSFT,   KC_UP,   KC_END,
    _______,   _______,      KC_LCTL, KC_LGUI, KC_LALT,   MO(1), XXXXXXX,  KC_SPC,                      XXXXXXX,  KC_SPC,   KC_RALT,  KC_RGUI,  KC_RCTL, KC_LEFT, KC_DOWN,  KC_RGHT
  ),
  [1] = LAYOUT_80_with_macro(
    _______,                 KC_SLEP, _______, _______, _______, _______, _______, _______,             _______, _______,   _______,  _______,  _______, _______, _______,  _______,
    _______,   _______,      _______, _______, _______, _______, _______, _______, _______,             _______, _______,   _______,  _______,  _______, _______, _______,  _______, _______,
    _______,   _______,      _______, MC_CLOS,   KC_P7,   KC_P8,   KC_P9, _______,             _______, _______, _______,   _______,  _______,  _______, _______, _______,  _______,
    _______,   _______,      _______, _______,   KC_P4,   KC_P5,   KC_P6, _______,             KC_LEFT, KC_DOWN,   KC_UP,  KC_RIGHT,  _______,  _______,          _______,  _______,
    _______,   _______,      _______,            KC_P0,   KC_P1,   KC_P2,   KC_P3, KC_PDOT,             _______, _______,   _______,  _______,  _______, _______, _______,  _______,
    _______,   _______,      _______, _______, _______, _______, _______, _______,                      _______, _______,   _______,  _______,  _______, _______, _______,  _______
  ),
};



////////////////////////////////////////////////////////////////////////////////
// QMK Lifecycle functions
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Initialization
////////////////////////////////////////////////////////////////////////////////
void keyboard_post_init_user(void) {
    // a decent color
    rgb_matrix_mode(RGB_MATRIX_SOLID_COLOR);
    rgb_matrix_sethsv(170, 255, 100);

    // just turn it off
    /* rgb_matrix_mode(RGB_MATRIX_SOLID_COLOR); */
    /* rgb_matrix_sethsv(HSV_OFF); */

    /* rgb_matrix_mode(RGB_MATRIX_CUSTOM_alpha_blocks); */
    /* rgb_matrix_mode(RGB_MATRIX_CUSTOM_debug_test); */

    /* rgb_matrix_sethsv(HSV_OFF); */
    /* rgb_matrix_mode(RGB_MATRIX_ALPHAS_MODS); */
    /* rgb_matrix_set_speed(100); */

    /* rgb_matrix_set_color_all(121, 134, 180); */
    /* rgb_matrix_mode(RGB_MATRIX_SOLID_COLOR); */
    /* rgb_matrix_set_color_all(0, 0, 180); */
    /* rgb_matrix_enable(); */

    // Debugging
    /* debug_enable=true; */
    /* debug_matrix=true; */
    /* debug_keyboard=true; */
    /* debug_mouse=true; */
}




////////////////////////////////////////////////////////////////////////////////
// While running
////////////////////////////////////////////////////////////////////////////////

// Customize right and left rotary push encoders
bool encoder_update_user(uint8_t index, bool clockwise) {
    if (index == 0) {
        if (clockwise) {
            tap_code(KC_WH_U);
        } else {
            tap_code(KC_WH_D);
        }
    } else if (index == 1) {
        if (clockwise) {
            tap_code(KC_VOLD);
        } else {
            tap_code(KC_VOLU);
        }
    }
    return false;
}

// macros
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case MC_CLOS:
            // send Alt+F4 to close windows
            register_code(KC_LALT);
            register_code(KC_F4);
            unregister_code(KC_LALT);
            unregister_code(KC_F4);
            break;
        default:
            break;
    }
    return true;
}


// RGB LED Indicators
// superseded by custom user matrix
bool rgb_matrix_indicators_advanced_user(uint8_t led_min, uint8_t led_max) {
    // Caps lock (highlight red when it's on)
    if (host_keyboard_led_state().caps_lock) {
        rgb_matrix_set_color(28, RGB_RED);
    } else {
        rgb_matrix_set_color(28, RGB_OFF);
    }

    // Layer indicator (highlight the affected keys when it's on)
    const int fn_keys[14] = {
        88, 89, 90, 91, // vim-like arrow keys
        19, 20, 21,     // numpad left hand
        26, 25, 24,     // numpad left hand
        30, 31, 32, 33  // numpad left hand
    };
    switch(get_highest_layer(layer_state|default_layer_state)) {
        case 1:
            // Normal fn layer keys
            for (int i = 0; i < 14; i++) {
                rgb_matrix_set_color(fn_keys[i], 0x22, 0xff, 0x88);
            }

            // special cases
            // "quit" key
            rgb_matrix_set_color(18, RGB_RED);
            // "sleep" key
            rgb_matrix_set_color(0, RGB_RED);
            break;
        default:
            break;
    }


    return true;
}




////////////////////////////////////////////////////////////////////////////////
// Shutdown
////////////////////////////////////////////////////////////////////////////////

bool shutdown_user(bool jump_to_bootloader) {
    if (jump_to_bootloader) {
        // red for bootloader
        rgb_matrix_mode(RGB_MATRIX_SOLID_COLOR);
        rgb_matrix_sethsv(HSV_RED);
    } else {
        // off for soft reset
        rgb_matrix_mode(RGB_MATRIX_SOLID_COLOR);
        rgb_matrix_sethsv(HSV_OFF);
    }
    // force flushing -- otherwise will never happen
    /* rgb_matrix_update_pwm_buffers(); */
    /* eeconfig_update_rgb_matrix(); */

    // false to not process kb level
    return false;
}
