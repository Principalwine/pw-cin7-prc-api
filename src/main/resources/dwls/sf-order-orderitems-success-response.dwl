%dw 2.0
output application/json
---
{
  success: true,
  apiName: "sf-api",
  version: "v1.0.0",
  correlationId: "05c09130-75a2-11eb-9dcf-aed564bf8171",
  timestamp: "1970-01-01T00:00:01.001-06:00",
  data: {
    message: "Success"
  }
} as Object {encoding: "UTF-8", mediaType: "application/json"}