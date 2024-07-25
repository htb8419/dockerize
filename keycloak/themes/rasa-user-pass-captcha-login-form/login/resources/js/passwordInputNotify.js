$(function () {
    let passwordInputs = $('input[type=password]');

    passwordInputs.each((i,inputPassword) => {
        let $inputPassword = $(inputPassword);
        inputPassword.addEventListener("keyup", event => {
            if (event.getModifierState && event.getModifierState("CapsLock")) {

                if ($inputPassword.nextAll(".capsLockOnNotify").length === 0) {
                    $inputPassword.after("<small class='capsLockOnNotify'>" + messagesProperties['capsLock.is.on'] + "</small>");
                }
            } else {
                $inputPassword.nextAll(".capsLockOnNotify").remove();
            }
        })
        inputPassword.addEventListener('keypress', (event) => {
            let evt = event.originalEvent;
            evt = (evt) ? evt : window.event;
            let charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode >= 1570 && charCode <= 1740) {
                if ($inputPassword.nextAll(".persianKeyboardNotify").length === 0) {
                    $inputPassword.after("<small class='persianKeyboardNotify'>" + messagesProperties['keyboard.is.persian'] + "</small>");
                }
            } else {
                $inputPassword.nextAll(".persianKeyboardNotify").remove();
            }
        });
    });
});