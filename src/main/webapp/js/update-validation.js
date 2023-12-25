


document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('update-form');
    

    form.addEventListener('submit', function (e) {
        let valid = true;

        const name = document.getElementById('name');
        const email = document.getElementById('email');
        const phone = document.getElementById('phone');
        const pwd = document.getElementById('pwd');
        const address = document.getElementById('address');
        const confirm = document.getElementById('confirm');

        const nameError = document.getElementById('name-error');
        const emailError = document.getElementById('email-error');
        const phoneError = document.getElementById('phone-error');
        const pwdError = document.getElementById('pwd-error');
        const addressError = document.getElementById('address-error');
        const confirmError = document.getElementById('confirm-error');

        if (!name.value) {
            nameError.style.display = 'block';
            valid = false;
        } else {
            nameError.style.display = 'none';
        }

        if (!email.value || !isValidEmail(email.value)) {
            emailError.style.display = 'block';
            valid = false;
        } else {
            emailError.style.display = 'none';
        }

        if (phone.value && !isValidPhone(phone.value)) {
            phoneError.style.display = 'block';
            valid = false;
        } else {
            phoneError.style.display = 'none';
        }

        if (!pwd.value) {
            pwdError.style.display = 'block';
            valid = false;
        } else {
            pwdError.style.display = 'none';
        }

        if (!address.value) {
            addressError.style.display = 'block';
            valid = false;
        } else {
            addressError.style.display = 'none';
        }

        if (!confirm.checked) {
            confirmError.style.display = 'block';
            valid = false;
        } else {
            confirmError.style.display = 'none';
        }

        if (!valid) {
            e.preventDefault();
        }
    });

    function isValidEmail(email) {
        const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        return emailRegex.test(email);
    }

    function isValidPhone(phone) {
        const phoneRegex = /^\d{10}$/;
        return phoneRegex.test(phone);
    }
});
