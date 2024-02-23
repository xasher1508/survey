<?php
/**
 * ---------------------------------------------------------------------

   MyOOS [Dumper]
   https://www.oos-shop.de/

   Copyright (c) 2013 - 2023 by the MyOOS Development Team.
   ----------------------------------------------------------------------
   Based on:

   MySqlDumper
   https://www.mysqldumper.de

   Copyright (C)2004-2011 Daniel Schlichtholz (admin@mysqldumper.de)
   ----------------------------------------------------------------------
   Released under the GNU General Public License
   ----------------------------------------------------------------------
 */

/**
 * configurations to update.
 *
 * enter more than one configurationsfile like this
 * $configurationfiles=array('myoosdumper','db2');
 */
$configurationfiles = [
                        'myoosdumper',
];

define('OOS_VALID_MOD', true);

define('APPLICATION_PATH', '/' == __DIR__ ? '' : __DIR__);
require_once APPLICATION_PATH.'/inc/functions.php';

$config['language'] = 'en';
$config['theme'] = 'mod';
$config['files']['iconpath'] = 'css/'.$config['theme'].'/icons/';

foreach ($configurationfiles as $conf) {
    $config['config_file'] = $conf;
    include $config['paths']['config'].$conf.'.php';
    GetLanguageArray();
    SetDefault();
}
