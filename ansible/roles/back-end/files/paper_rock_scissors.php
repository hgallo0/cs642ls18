<?php

  $command = escapeshellcmd("python paper_rock_scissors.py $argv[1]");
  $output = shell_exec($command);
  echo $output;
?>
