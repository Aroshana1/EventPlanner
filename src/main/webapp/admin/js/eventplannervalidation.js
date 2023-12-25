/**
 * 
 */
// validation

document.getElementById('eventPlannerForm').addEventListener('submit', function (e) {
    const pphoneInput = document.getElementById('pphone');
    const pphoneValue = pphoneInput.value;

    if (pphoneValue.length !== 10 || isNaN(pphoneValue)) {
        e.preventDefault(); // Prevent form submission
        alert('Please enter a valid 10-digit phone number.');
        pphoneInput.focus();
    }
});
