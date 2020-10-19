
const STAGING_URL = "http://public-api.pgeon.rocks/";
const DEV_URL = "http://public-api-dev.pgeon.delivery/";

const API_URL = STAGING_URL;

const LOGIN_URL = API_URL + "staff/login";
const DELIVERY_ORDER_LIST_URL = API_URL + "staff/driver/delivery-order/?hide_complete={hide_complete}&version={version}";