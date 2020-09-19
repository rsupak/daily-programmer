const emailregex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/
const validateEmail = email => emailregex.test(email);

let email = 'richard.supak@icloud.com';

console.log(validateEmail(email));
