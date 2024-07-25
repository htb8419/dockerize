const messagesProperties = {
    "please.wait": "لطفاً منتظر باشید",
    "common.mandatory.field": "لطفا این قسمت را خالی نگذارید",
    "username.mandatory.field": "نام کاربری را وارد کنید.",
    "password.mandatory.field": "کلمه عبور را وارد کنید.",
    "capsLock.is.on" : "کلید Caps Lock روشن است.",
    "keyboard.is.persian": "صفحه کلید شما فارسی است."
};

$(document).on('click', 'form button[type=submit]', function (event) {
    let $username = $('#username');
    let $txtPassword = $('#txtPassword');
    let $botDetectCaptchaUserInput = $('#botDetectCaptchaUserInput');
    let isValid = true;
    if ($username.val() == null || $username.val().trim() === '') {
        isValid = notifyOnEmptyElement($username, 'username.mandatory.field', event);
    }
    if ($txtPassword.val() == null || $txtPassword.val().trim() === '') {
        isValid = notifyOnEmptyElement($txtPassword, 'password.mandatory.field', event);
    }
    if ($botDetectCaptchaUserInput.length === 1 && ($botDetectCaptchaUserInput.val() == null
        || $botDetectCaptchaUserInput.val().trim() === '')) {
        isValid = notifyOnEmptyElement($botDetectCaptchaUserInput, 'common.mandatory.field', event);
    }
    return isValid;
});

function notifyOnEmptyElement(elm, msg, event) {
    elm.notify(messagesProperties[msg],
        {position: "top"}
    );
    event.preventDefault();
    return false;
}