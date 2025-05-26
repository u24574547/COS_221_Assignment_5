<?php

class ErrorHandler
{
  public static function errorMessage(Throwable $exception)
  {
    http_response_code(500);
    echo json_encode([
      "success" => false,
      'timestamp' => time(),
      //"message"=>"An error occurred while processing your request."
      'data' => $exception->getMessage() . ' At line number: ' . $exception->getLine()
    ]);
    exit;
  }
}
