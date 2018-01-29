<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// don't change if you already entered some data
$config['halalan']['pin'] = FALSE;
$config['halalan']['password_pin_generation'] = "web";
$config['halalan']['password_pin_characters'] = "nozero";
$config['halalan']['password_length'] = 5;
$config['halalan']['pin_length'] = 4;
$config['halalan']['captcha'] = TRUE;
$config['halalan']['captcha_length'] = 4;
$config['halalan']['show_candidate_details'] = FALSE;
$config['halalan']['generate_image_trail'] = TRUE;
$config['halalan']['image_trail_path'] = "/opt/lampp/htdocs/halalan/public/vpt/";

$config['base_url'] = "http://localhost/halalan/";
$config['encryption_key'] = "UfkN49UXkraw7qVX72At4dVTUz3mmQ2G";

?>
