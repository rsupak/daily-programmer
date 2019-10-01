var VALID_PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)? ?[-]?[\d]{3}[-]?[\d]{4}$/;
var phone = "555-555-5555";
console.log(VALID_PHONE_NUMBER_REGEX.test(phone));
