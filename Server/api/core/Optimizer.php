<?php
function print_mem()
{
	/* Currently used memory */
	$mem_usage = memory_get_usage();
	
	/* Currently used memory including inactive pages */
	$mem_full_usage = memory_get_usage(TRUE);
	
	/* Peak memory consumption */
	$mem_peak = memory_get_peak_usage();

	echo 'This script now uses ' . round($mem_usage / 1024) . 'KB of memory.<br>';
	echo 'Real usage: ' . round($mem_usage / 1024) . 'KB.<br>';
	echo 'Peak usage: ' . round($mem_peak / 1024) . 'KB.<br><br>';
}


function preview($value)
{
    echo "<pre>";
    print_r($value);
    echo "</pre>";
}