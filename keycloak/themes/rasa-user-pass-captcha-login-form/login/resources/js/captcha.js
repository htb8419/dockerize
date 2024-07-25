$(document).ready(function () {
    let $botDetectCaptcha = $('#botDetectCaptchaId');
    if ($botDetectCaptcha.length === 1) {
        let captchaClient = $botDetectCaptcha.captcha({
            captchaEndpoint: captchaUrl,
        });
        $('#kc-form-login').on('submit', () => {
            const captchaCode = captchaClient.getUserEnteredCaptchaCode();
            const captchaId = captchaClient.getCaptchaId();
            $('#captchaId').val(captchaId);
            $('#captchaCodeId').val(captchaCode);
        });
        document.addEventListener("DOMNodeInserted", (ev) => {
            let captchaImg = $('#botDetectCaptchaStyle_CaptchaImageDiv');
            if (captchaImg && captchaImg.length === 1) {
                captchaImg.find('a').remove();
            }
        });
    }
});