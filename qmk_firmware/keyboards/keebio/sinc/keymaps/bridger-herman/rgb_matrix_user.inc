// Custom color declarations
// Base color
// #define HSV_BASE1_T (HSV) {137, 255, 100} // blue
#define HSV_BASE1_T (HSV) {(131.0 / 360.0) * 255, (100.0 / 100.0) * 255, (82.0 / 100.0) * 255}
#define RGB_BASE1_T hsv_to_rgb(HSV_BASE1_T)
#define HSV_BASE1 HSV_BASE1_T.h, HSV_BASE1_T.s, HSV_BASE1_T.v
#define RGB_BASE1 RGB_BASE1_T.r, RGB_BASE1_T.g, RGB_BASE1_T.b

// Highlight 1
// #define HSV_HI1_T (HSV) {15, 255, 120} // orange
#define HSV_HI1_T (HSV) {(28.0 / 360.0) * 255, (100.0 / 100.0) * 255, (60.0 / 100.0) * 255} // orange
#define RGB_HI1_T hsv_to_rgb(HSV_HI1_T)
#define HSV_HI1 HSV_HI1_T.h, HSV_HI1_T.s, HSV_HI1_T.v
#define RGB_HI1 RGB_HI1_T.r, RGB_HI1_T.g, RGB_HI1_T.b

// Highlight 2
// #define HSV_HI2_T (HSV) {244, 255, 120} // pink
#define HSV_HI2_T (HSV) {(268.0 / 360.0) * 255, (100.0 / 100.0) * 255, (82.0 / 100.0) * 255} // orange
#define RGB_HI2_T hsv_to_rgb(HSV_HI2_T)
#define HSV_HI2 HSV_HI2_T.h, HSV_HI2_T.s, HSV_HI2_T.v
#define RGB_HI2 RGB_HI2_T.r, RGB_HI2_T.g, RGB_HI2_T.b

// Declare custom effects using the RGB_MATRIX_EFFECT macro
RGB_MATRIX_EFFECT(alpha_blocks)
RGB_MATRIX_EFFECT(debug_indexing_snake)
RGB_MATRIX_EFFECT(debug_test)

// Step 2.
// Define effects inside the `RGB_MATRIX_CUSTOM_EFFECT_IMPLS` ifdef block
#ifdef RGB_MATRIX_CUSTOM_EFFECT_IMPLS

////////////////////////////////////////////////////////////////////////////////
// DEBUG INDEXING SNAKE
// Highlights one LED at a time so you can get a sense of what the indexing
// scheme is
////////////////////////////////////////////////////////////////////////////////
static uint16_t key_index;
static uint16_t loop_index;

static void debug_indexing_snake_init(effect_params_t* params) {
    key_index = 1;
    loop_index = 0;
}


static bool debug_indexing_snake_run(effect_params_t* params) {
    RGB_MATRIX_USE_LIMITS(led_min, led_max);

    rgb_matrix_set_color(key_index - 1, 0x00, 0x00, 0x00);
    rgb_matrix_set_color(key_index, 0xff, 0x00, 0x00);

    loop_index++;
    if (loop_index % 10 == 0) {
        key_index++;
    }

    if (key_index >= RGB_MATRIX_LED_COUNT) {
        key_index = 1;
        loop_index = 0;
    }

    return rgb_matrix_check_finished_leds(led_max);
}

static bool debug_indexing_snake(effect_params_t* params) {
    if (params->init) debug_indexing_snake_init(params);
    return debug_indexing_snake_run(params);
}


////////////////////////////////////////////////////////////////////////////////
// DEBUGGING TEST
// Simple Debugging Test
////////////////////////////////////////////////////////////////////////////////
// 58 keys on the left half
const uint8_t left_right_offset = 58;

static bool debug_test(effect_params_t* params) {
    RGB_MATRIX_USE_LIMITS(led_min, led_max);

    // rgb_matrix_set_color(0, 0x99, 0x11, 0x00);
    // rgb_matrix_set_color(1, 0x00, 0x00, 0xff);
    // rgb_matrix_set_color(2, 0x88, 0x22, 0x00);
    // rgb_matrix_set_color(3, 0x77, 0x33, 0x00);
    // rgb_matrix_set_color(4, 0x00, 0x00, 0xff);
    // rgb_matrix_set_color(5, 0x66, 0x44, 0x00);
    // rgb_matrix_set_color(6, 0x55, 0x55, 0x00);
    // rgb_matrix_set_color(7, 0x44, 0x66, 0x00);
    // rgb_matrix_set_color(8, 0x00, 0x00, 0xff);
    // rgb_matrix_set_color(9, 0x33, 0x77, 0x00);

    // rgb_matrix_set_color(left_right_offset + 0, 0x99, 0x00, 0x11);
    // rgb_matrix_set_color(left_right_offset + 1, 0x00, 0xff, 0x00);
    // rgb_matrix_set_color(left_right_offset + 2, 0x88, 0x00, 0x22);
    // rgb_matrix_set_color(left_right_offset + 3, 0x77, 0x00, 0x33);
    // rgb_matrix_set_color(left_right_offset + 4, 0x00, 0xff, 0x00);
    // rgb_matrix_set_color(left_right_offset + 5, 0x66, 0x00, 0x44);
    // rgb_matrix_set_color(left_right_offset + 6, 0x55, 0x00, 0x55);
    // rgb_matrix_set_color(left_right_offset + 7, 0x00, 0xff, 0x00);
    // rgb_matrix_set_color(left_right_offset + 8, 0x44, 0x00, 0x66);
    // rgb_matrix_set_color(left_right_offset + 9, 0x33, 0x00, 0x77);
    // rgb_matrix_set_color(left_right_offset + 10, 0x00, 0xff, 0x00);
    // rgb_matrix_set_color(left_right_offset + 11, 0x22, 0xff, 0x88);

    const int fn_keys[4] = {88, 89, 90, 91};
    for (int i = 0; i < 4; i++) {
        rgb_matrix_set_color(fn_keys[i], 0x22, 0xff, 0x88);
    }

    return rgb_matrix_check_finished_leds(led_max);
}

////////////////////////////////////////////////////////////////////////////////
// ALPHA BLOCKS
// Highlight alpha keys, numeric keys, modifiers, arrow keys, etc.
////////////////////////////////////////////////////////////////////////////////
static void alpha_blocks_init(effect_params_t* params) {
}

static bool alpha_blocks_run(effect_params_t* params) {
    RGB_MATRIX_USE_LIMITS(led_min, led_max);
    // for (uint8_t i = led_min; i < led_max; i++) {
        // RGB_MATRIX_TEST_LED_FLAGS();
        // if (HAS_FLAGS(g_led_config.flags[i], LED_FLAG_UNDERGLOW)) {
            // rgb_matrix_set_color(i, 0xff, 0x00, 0x00);
        // } else {
            // rgb_matrix_set_color(i, 0x00, 0xff, 0x00);
        // }
    // }

    // set caps lock
    // if (host_keyboard_led_state().caps_lock) {
        // rgb_matrix_set_color(28, RGB_RED);
    // }

    return rgb_matrix_check_finished_leds(led_max);
}

static bool alpha_blocks(effect_params_t* params) {
    if (params->init) alpha_blocks_init(params);
    return alpha_blocks_run(params);
}

#endif // RGB_MATRIX_CUSTOM_EFFECT_IMPLS
