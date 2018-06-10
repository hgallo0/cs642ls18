<?php

  $command = escapeshellcmd("python paper_rock_scissors.py paper");
  $output = shell_exec($command);
  echo $output . "\r\n";

  echo "<a href='http://107.23.38.71/' target='_blank'>Click here to play again</a>";

?>
